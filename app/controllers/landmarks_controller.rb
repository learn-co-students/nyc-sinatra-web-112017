class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  #create a new figure
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #create landmarks

    redirect to "/landmarks/#{@landmark.id}"
  end


  #view a single id
  get '/landmarks/:id' do
    erb :'landmarks/show'
  end

  #update
  get '/landmarks/:id/edit' do
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do

    redirect to "/landmarks/#{@landmark.id}"
  end

  #delete
  delete '/landmarks/:id' do

    redirect to '/landmarks'
  end

end
