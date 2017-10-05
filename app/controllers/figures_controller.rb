require 'pry'

class FiguresController < ApplicationController

  get '/' do
    redirect '/figures'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])
    if !params[:new_title][:name].epmty?
      @figure.titles << Title.create(params[:new_title])
    end
    if !params[:new_landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:new_landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(:id)
    erb :'/figures/show'
  end

end
