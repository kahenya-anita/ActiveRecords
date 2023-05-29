require 'sinatra'
require 'sinatra/activerecord'

#DB Configurations
set :database_file, 'config/database.yml'

#Models
require './models/user'

#Route Checking
get '/' do
    'Hello Sinatra Active Records!'
end

#Create a User
post '/users' do
    user = User.new(params[:user])
    if user.save
        redirect '/users'
    else
       'Failed to create a new user' 
    end
end

#Read Users in the DB
get '/users' do
    @users = User.all
    erb :users_index
end