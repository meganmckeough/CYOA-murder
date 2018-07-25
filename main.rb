require 'sinatra/reloader'    
require 'sinatra'
require 'pg'
require 'pry'
require 'bcrypt'
require_relative 'db_config'

require_relative 'models/user'
require_relative 'models/character'

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

get '/story' do
	erb :story
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
	character = Character.new
	character.name = params[:name]
	character.save
	redirect '/character/edit'
end

get '/character/edit' do
	@character = Character.last
	erb :background
end

put '/character/:id/edit' do
	character = Character.find(params[:id])
	character.background = params[:background]
	character.save
	redirect "/story"
end

post '/session' do
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
 		session[:user_id] = user.id
 		redirect '/'
	else
		erb :login
	end
end

delete '/session' do
	session[:user_id] = nil
	redirect '/'
end
