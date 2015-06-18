class ArticlesController < ApplicationController
  def index
    @folder = params[:folder]
  end

  def show
    @id = params[:id]
    @folder = params[:folder]
  end

end
