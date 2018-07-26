require 'sinatra/reloader'    
require 'sinatra'
require 'pg'
require 'pry'
require 'bcrypt'
require_relative 'db_config'

require_relative 'models/user'
require_relative 'models/character'
require_relative 'models/segment'
require_relative 'models/ending'

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
	redirect '/character'
end

post '/character/new' do
	redirect '/login' unless logged_in?
	character = Character.new
	character.name = params[:name]
	character.save
	redirect '/character/edit'
end

get '/character/edit' do
	redirect '/login' unless logged_in?
	@character = Character.order(:created_at).last
	erb :background
end

get '/enter' do
	redirect '/login' unless logged_in?
	@character = Character.order(:created_at).last
	erb :enter
end

get '/segments/ending/:story_id' do
	redirect '/login' unless logged_in?
	@segment = Segment.find_by(story_id: params[:story_id]) 
	@character = Character.order(:created_at).last
	@ending = Ending.find_by(story_id: params[:story_id])
	erb :ending
end

get '/scores' do
	redirect '/login' unless logged_in?
	@characters = Character.all
	erb :scores
end

get '/segments/:story_id' do
	redirect '/login' unless logged_in?
	@character = Character.order(:created_at).last
	@segment = Segment.find_by(story_id: params[:story_id])
	erb :segments
end

put '/ending/:story_id/:id/edit' do 
	redirect '/login' unless logged_in?
	character = Character.find(params[:id])
	ending = Ending.find_by(story_id: params[:story_id])
	character.ending = ending.content
	character.save
	redirect "/scores"
end

put '/character/:id/edit' do
	redirect '/login' unless logged_in?
	character = Character.find(params[:id])
	character.background = params[:background]
	character.save
	redirect "/enter"
end

post '/session' do
	redirect '/login' unless logged_in?
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
 		session[:user_id] = user.id
 		redirect '/'
	else
		erb :login
	end
end

delete '/session' do
	redirect '/login' unless logged_in?
	session[:user_id] = nil
	redirect '/'
end

