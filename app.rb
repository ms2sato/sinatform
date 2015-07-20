require 'rubygems'
require 'bundler'
Bundler.require

require 'sinatra'
require 'sinatra/reloader'
require 'rest_client'

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

post '/send_mail' do
  email = params[:email]
  message = params[:message]
  send_message(email, message)  

  erb :thanks
end

def send_message(email, message)
    RestClient.post "https://api:key-cabe4d08ae4cc3fab6b5946eb54f0123"\
      "@api.mailgun.net/v3/sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org/messages",
      :from => "お問い合わせ <ms2.sato@gmail.com>",
      :to => "MasashiSato <ms2.sato@gmail.com>",
      :subject => "お問い合わせがきました！",
      :text => "email: #{email}さんからお問い合わせがきました。本文: #{message}"
end
