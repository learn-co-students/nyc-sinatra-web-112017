class FiguresController < ApplicationController

  #index
  get '/' do
    redirect "/figures"
  end

  get '/figures' do
    erb :'figures/index'
  end

  #create a new figure
  get '/figures/new' do
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    #create figures

    @title = Title.find_or_create_by(params[:title])
    @figure = Figure.create(params[:figure])
    @landmark = Landmark.find_or_create_by(params[:landmark])
    #make association.
    @landmark.figure_id = @figure.id

    binding.pry

    # @figure.titles << @title
    # @figure.landmark = @landmark
    redirect to "/figures/#{@figure.id}"
  end


  #view a single id
  get '/figures/:id' do
    erb :'figures/show'
  end

  #update
  get '/figures/:id/edit' do
    erb :'figures/edit'
  end

  patch '/figures/:id' do

    redirect to "/figures/#{@figure.id}"
  end

  #delete
  delete '/figures/:id' do

    redirect to '/figures'
  end


end
