class UsersController < ApplicationController
binding.pry
  get '/login' do
    erb :'user/login'
  end

  get '/signup' do
    erb :'user/signup'
  end

  get '/user/:slug' do
    @user=User.find_by_slug(params[:slug])
    binding.pry
    erb :'/user/tweets'
  end

  post '/signup' do
    @user=User.create(:username =>params(:username), :password => params(:password), email =>params(:email))
  end

  post '/login' do
    @tweets=Tweet.all
    erb :'/tweets/tweets'
  end

end
