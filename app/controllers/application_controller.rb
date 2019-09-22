require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    register Sinatra::Flash
  end

  get '/' do
    erb :'index'
  end

  def is_logged_in?
    !!current_user
  end

  def current_user
    return if !session[:user_id]
      @user ||= User.find(session[:user_id])
  end

end
