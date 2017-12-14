class FiguresController < ApplicationController

  #index
  get '/figures' do
    erb :index
  end

  #create a new figure
  get '/figures/new' do
    erb :new
  end

  post '/figures' do
    #create figures

    redirect to "/figures/#{@figure.id}"
  end


  #view a single id
  get '/figures/:id' do
    erb :show
  end

  #update
  get '/figures/:id/edit' do
    erb :edit
  end

  patch '/figures/:id' do

    redirect to "/figures/#{@figure.id}"
  end

  #delete
  delete '/figures/:id' do end

    redirect to '/figures'
  end


end
