require 'sinatra/reloader'    
require 'sinatra'
require 'pg'
require 'pry'
require_relative 'db_config'

get '/' do
  erb :index
end





