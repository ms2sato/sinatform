require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index  
end

get '/about' do
  erb :about
end

post '/confirm' do
  @email = params[:email]
  @message = params[:message]
  erb :confirm
end
