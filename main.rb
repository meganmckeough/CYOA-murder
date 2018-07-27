# require 'sinatra/reloader'    
require 'sinatra'
require 'pg'
require 'pry'
require 'bcrypt'
require_relative 'db_config'

require_relative 'models/user'
require_relative 'models/character'
require_relative 'models/segment'
require_relative 'models/ending'
require_relative 'models/score'
require_relative 'models/user_character'

get '/login' do
	erb :login
end

get '/register' do
	erb :register
end

get '/' do
  	erb :index
end

get '/character' do
	redirect '/login' unless logged_in?
	erb :character
end

get '/about' do
	erb :about
end

enable :sessions

helpers do 
	def current_user
		User.find_by(id: session[:user_id])
	end

	def logged_in?
		!!current_user
	end
end

post '/register/new' do
	user = User.new
	user.name = params[:name]
	user.email = params[:email]
	user.password = params[:password]
	user.save
	session[:user_id] = user.id
	redirect '/character'
end

post '/character/new' do
	redirect '/login' unless logged_in?
	character = Character.new
	character.name = params[:name]
	character.save
	user_character = User_character.new
	user_character.user_id = current_user.id
	user_character.char_id = character.id
	user_character.save
	redirect '/character/edit'
end

get '/character/edit' do
	user_characters = User_character.where(:user_id == current_user.id).all
	current_character = user_characters.order(:created_at).last
	@character = Character.find(current_character.char_id)
	erb :background
end

get '/enter' do
	user_characters = User_character.where(:user_id == current_user.id).all
	current_character = user_characters.order(:created_at).last
	@character = Character.find(current_character.char_id)
	erb :enter
end

get '/segments/ending/:story_id' do
	redirect '/login' unless logged_in?
	@segment = Segment.find_by(story_id: params[:story_id]) 
	user_characters = User_character.where(:user_id == current_user.id).all
	current_character = user_characters.order(:created_at).last
	@character = Character.find(current_character.char_id)
	@ending = Ending.find_by(story_id: params[:story_id])
	erb :ending
end

get '/scores' do
	redirect '/login' unless logged_in?
	@scores = Score.all
	erb :scores
end

get '/segments/:story_id' do
	redirect '/login' unless logged_in?
	user_characters = User_character.where(:user_id == current_user.id).all
	current_character = user_characters.order(:created_at).last
	@character = Character.find(current_character.char_id)
	@segment = Segment.find_by(story_id: params[:story_id])
	erb :segments
end

put '/ending/:story_id/:id/edit' do 
	redirect '/login' unless logged_in?
	user_characters = User_character.where(:user_id == current_user.id).all
	current_character = user_characters.order(:created_at).last
	character = Character.find(current_character.char_id)
	ending = Ending.find_by(story_id: params[:story_id])
	character.ending = ending.content
	character.save
	score = Score.new
	score.content = "#{current_user.name} finished as Detective #{ character.name }, who #{ character.ending }"
	score.save
	redirect '/scores'
end

put '/character/:id/edit' do
	redirect '/login' unless logged_in?
	user_characters = User_character.where(:user_id == current_user.id).all
	current_character = user_characters.order(:created_at).last
	character = Character.find(current_character.char_id)
	character.background = params[:background]
	character.save
	redirect '/enter'
end

post '/session' do
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
 		session[:user_id] = user.id
 		redirect '/character'
	else
		erb :login
	end
end

delete '/session' do
	session[:user_id] = nil
	redirect '/'
end

