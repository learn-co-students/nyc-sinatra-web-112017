class FiguresController < ApplicationController


  get "/figures" do
    @f = Figure.all
    erb :"figures/index"
  end


  get "/figures/new" do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end


  post "/figures" do
    @f = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @f.titles << Title.find_or_create_by(params[:title])
    end

    if !params[:landmark][:name].empty?
      @f.landmarks << Landmark.find_or_create_by(params[:landmark])

    end


    redirect :"figures/#{@f.id}"
  end


  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  post "/figures/:id" do
    @figures = Figure.find(params[:id])
    @figures.update(params[:figure])

    if !params[:landmark][:name].empty?
      @f.landmarks << Landmark.find_or_create_by(params[:landmark])
    end

    redirect "/figures/#{@figures.id}"
  end





end
