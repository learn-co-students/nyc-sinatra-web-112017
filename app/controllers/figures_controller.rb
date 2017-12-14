class FiguresController < ApplicationController

  #INDEX
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  #NEW
  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    redirect "figures/#{@figure.id}"
  end

  #SHOW
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  #EDIT
  get '/figures/:id/edit' do
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params)
    redirect "figures/#{@figure.id}"
  end


end
