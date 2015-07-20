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

get '/test' do
  send_simple_message
end

def send_simple_message
    RestClient.post "https://api:key-cabe4d08ae4cc3fab6b5946eb54f0123"\
      "@api.mailgun.net/v3/sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org>",
      :to => "MasashiSato <ms2.sato@gmail.com>",
      :subject => "Hello MasashiSato",
      :text => "Congratulations MasashiSato, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
end
