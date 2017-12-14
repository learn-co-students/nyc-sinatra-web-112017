class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

end
