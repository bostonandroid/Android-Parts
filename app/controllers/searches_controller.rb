class SearchesController < ApplicationController
  def new
    @search = Search.new
    render :layout => 'home'
  end

  def index
    @search = Search.new(params[:search])
  end
end
