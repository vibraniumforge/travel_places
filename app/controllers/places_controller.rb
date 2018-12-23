class PlacesController < ApplicationController

  get '/places' do
    if Helpers.is_logged_in?(session)
      @places=Place.all
      erb :'/places/places'
    else
      redirect to '/users/login'
    end
  end

  get '/places/new' do
    user = Helpers.current_user(session)
    if user.nil?
      redirect to '/login'
    else
      erb :'places/create_place'
    end
  end

  get '/places/:id' do
    if Helpers.is_logged_in?(session)
      @place=Place.find(params[:id])
      erb :'/places/show_place'
    else
      redirect to '/login'
    end
  end

  get '/places/:id/edit' do
    redirect to '/login' unless Helpers.is_logged_in?(session)
    @place = Place.find(params[:id])
    if @place.user == Helpers.current_user(session)
      erb :'/places/edit_place'
    else
      redirect to '/login'
    end
  end

  post '/places' do
    user = Helpers.current_user(session)
    if user.nil?
      redirect to '/users/login'
    # elsif params[:place][:continent].empty?||
    #   params[:place][:country].empty? ||
    #   params[:place][:state].empty? ||
    #   params[:place][:city].empty?
    #   redirect to '/places/new'
    else
      # user.places.build({content: params[:place][:continent],
      # [:place][:country],
      # [:place][:state],
      # [:place][:city],
      # [:place][:notes]})
      user.save
    end
    redirect to '/places'
  end

  patch "/places/:id" do
    @place=Place.find(params[:id])
    if params[:place][:continent].empty?
      # params[:place][:country].empty? ||
      # params[:place][:state].empty? ||
      # params[:place][:city].empty?
      redirect to "/places/#{@place.id}/edit"
    end
    @place.update(params[:place])
    @place.save
    redirect to "/places/#{@place.id}"
  end

  delete '/places/:id/delete' do
    if Helpers.is_logged_in?(session)
      @place=Place.find(params[:id])
      if @place.user==Helpers.current_user(session)
        @place=Place.find_by_id(params[:id])
        @place.delete
        redirect to '/places'
      else
        redirect to '/places'
      end
    else
      redirect to '/login'
    end
  end

end
