require 'rack-flash'
class PlacesController < ApplicationController

  use Rack::Flash

  get '/places' do
    if Helpers.is_logged_in?(session)
      @places=Helpers.current_user(session).places
      flash[:message] = "Login successful."
      flash.now[:notice] = "Login successful."
      erb :'places/index'
    else
      redirect to '/users/login'
    end
  end

  get '/places/new' do
    user = Helpers.current_user(session)
    if user.nil?
      redirect to '/login'
    else
      erb :'places/new'
    end
  end

  get '/places/:id' do
    if Helpers.is_logged_in?(session)
      @place=Place.find(params[:id])
      erb :'places/show'
    else
      redirect to '/login'
    end
  end

  get '/places/:id/edit' do
    redirect to '/login' unless Helpers.is_logged_in?(session)
    @place = Place.find(params[:id])
    if @place.user == Helpers.current_user(session)
      erb :'places/edit'
    else
      redirect to '/login'
    end
  end

  post '/places' do
    user = Helpers.current_user(session)
    if user.nil?
      redirect to '/users/login'
    elsif params[:place][:continent].empty?||
      params[:place][:country].empty? ||
      params[:place][:state].empty? ||
      params[:place][:city].empty?
      flash[:message] = "All fields (except notes) must be filled in."
      redirect to '/places/new'
    else
      user.places << Place.new({
      continent: params[:place][:continent],
      country: params[:place][:country],
      state: params[:place][:state],
      city: params[:place][:city],
      notes: params[:place][:notes]
      })
      user.save
      flash[:message] = "New place successfully created."
    end
    redirect to '/places'
  end

  patch "/places/:id" do
    @place=Place.find(params[:id])
    if params[:place][:continent].empty? ||
      params[:place][:country].empty? ||
      params[:place][:state].empty?
      params[:place][:city].empty?
      flash[:message] = "All fields (except notes) must be filled in."
      redirect to "/places/#{@place.id}/edit"
    end
    @place.update(params[:place])
    @place.save
    flash[:message] = "Place successfully updated."
    redirect to "/places/#{@place.id}"
  end

  delete '/places/:id/delete' do
    if Helpers.is_logged_in?(session)
      @place=Place.find(params[:id])
      if @place.user==Helpers.current_user(session)
        @place=Place.find_by_id(params[:id])
        @place.delete
        flash[:message] = "Place successfully deleted."
        redirect to '/places'
      else
        redirect to '/places'
      end
    else
      redirect to '/login'
    end
  end

end
