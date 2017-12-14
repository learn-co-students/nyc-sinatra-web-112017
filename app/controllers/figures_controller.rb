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
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    #create figures
    @figure = Figure.create(params[:figure])
    @landmark = Landmark.find_or_create_by(params[:landmark])

    #iterate through the existing titles and make association in FigureTitles
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        existing_title = Title.find(title_id)
        @figure.titles << existing_title
      end
    end
    #make a new one if the form has a custom title

    if params[:title]
      @title = Title.find_or_create_by(params[:title])
      @figure.titles << @title
    end

    #make association.
    @landmark.figure_id = @figure.id

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
