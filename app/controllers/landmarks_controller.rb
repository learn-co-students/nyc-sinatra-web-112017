class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    binding.pry
    @landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    erb :'/landmarks/edit'
  end

end
