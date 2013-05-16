require 'rubygems'
require 'sinatra'    
require 'pony'
require "sinatra/activerecord"
require '.config/environments'

class Post < ActiveRecord::Base
  def up
      create_table :posts do |t|
        t.string :title
        t.text :body
        t.timestamps
      end
      Post.create(title: "My first post", body: "And this is the post's content.")
      Post.create(title: "How to lasso your dog", 
                  body: "1. Tie a rope into a lasso. 2. Swing it over that unruly dog's torso. 3. Gently pull.")
      Post.create(title: "Top 10 coffee shops in Austin", body: "1..10: Epoch Coffee, the 24/7 coffee shop.")
    end

    def down
      drop_table :posts
    end
end

get '/contact.html' do
  erb :contact
end

get '/projects.html' do
  erb :projects
end

get '/' do
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




