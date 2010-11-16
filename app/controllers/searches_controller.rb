class SearchesController < ApplicationController
  respond_to :html, :xml, :only => :index

  def new
    @search = Search.new
    render :layout => 'home'
  end

  def index
    @search = Search.new(params[:search])
  end
end
