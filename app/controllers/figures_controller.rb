class FiguresController < ApplicationController

  #INDEX
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  #NEW
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure_title = FigureTitle.create({title: @title, figure: @figure})
    end
    redirect "figures/#{@figure.id}"
  end

  #SHOW
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  #EDIT
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure_title = FigureTitle.create({title: @title, figure: @figure})
    end
    redirect "figures/#{@figure.id}"
  end


end
