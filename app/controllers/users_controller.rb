class UsersController < ApplicationController

  get '/login' do
    binding.pry
    if Helpers.is_logged_in?(session)
      redirect to '/places'
    else
      erb :'/users/login'
    end
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/places'
    end
    erb :'/users/create_user'
  end

    get '/users/:slug' do
      @user=User.find_by_slug(params[:slug])
      if !@user.nil?
        erb :'/places/places'
      else
        erb :'/users/login'
      end
  end

  post '/signup' do
    if !params.has_value?("")
      @user=User.create(params)
      session[:user_id] = @user.id
      redirect to '/places'
    else
      redirect to '/signup'
    end
  end

  post '/login' do
    @user=User.find_by(:username=>params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect to '/places'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
    else
      redirect to '/'
    end
    redirect to '/login'
  end

end
