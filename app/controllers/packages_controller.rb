class PackagesController < ApplicationController
  def new
    @package = current_maintainer.packages.new
    @package.versions.build
  end

  def create
    @package = current_maintainer.packages.build(params[:package])
    if @package.save
      redirect_to @package
    else
      render :new
    end
  end

  def show
    @package = Package.find(params[:id])
  end
end
