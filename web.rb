require 'rubygems'
require 'sinatra'    
require 'pony'

get '/contact.html' do
  erb :contact
end

get '/projects.html' do
  erb :projects
end

get '/index.html' do
  erb :index
end

get '/blog.html' do
  erb :blog
end

get '/success.html' do
  erb :success
end

get '/learning.html' do
  erb :learning
end

get '/tips.html' do
  erb :tips
end


post '/contact.html' do  
  "You said '#{params[:message]}'"
  
    Pony.mail(
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'jhylau1@gmail.com',
      :subject => params[:name],
      :body => params[:message] + " my emails is: " + params[:email],
      :port => '587',
      :via => :smtp,
      :via_options => { 
        :address              => 'smtp.gmail.com', 
        :port                 => '587', 
        :enable_starttls_auto => true, 
        :user_name            => 'jhylau1', 
        :password             => 'yoloventures2332.', 
        :authentication       => :plain, 
        :domain               => 'localhost.localdomain'
        })
     redirect '/success.html'
end 




