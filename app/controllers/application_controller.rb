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

  # def current_user(session)
  #   @user = User.find_by_id(session[:user_id])
  #   if @user.is_a?(User)
  #     @user
  #   end
  # end

  def is_logged_in?
    # !!User.find_by_id(session[:user_id])
    !!current_user
  end

  def current_user
    return if !session[:user_id]
      @user ||= User.find(session[:user_id])
  end

end
