class FiguresController < ApplicationController

  #index
  get '/' do
    redirect "/figures"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #create a new figure
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    #create figures
    @figure = Figure.create(params[:figure])
    # @landmark = Landmark.find_or_create_by(params[:landmark])

    #make a new title if the form has a custom title

    if params[:title]
      @title = Title.find_or_create_by(params[:title])
      @figure.titles << @title
    end

    #make a new Landmark if the form has a custom landmark

    if params[:landmark]
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @figure.landmarks << @landmark
    end

    # @figure.titles << @title
    # @figure.landmark = @landmark
    redirect to "/figures/#{@figure.id}"
  end


  #view a single id
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  #update
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    @title = Title.find_or_create_by(params[:title])
    @figure.titles << @title
    @landmark = Landmark.find_or_create_by(params[:landmark])
    @figure.landmarks << @landmark
    redirect to "/figures/#{@figure.id}"
  end

  #delete
  delete '/figures/:id' do

    redirect to '/figures'
  end


end
