class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if params[:landmark][:name].length > 0
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @figure.landmarks << @landmark
    end

    if params[:title][:name].length > 0
      @title = Title.find_or_create_by(params[:title])
      @figure.titles << @title
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figures = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.year_completed = params[:figure][:year_completed]
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  delete '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.destroy
    redirect "/figures"
  end

end
