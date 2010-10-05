class PackagesController < ApplicationController
  before_filter :ensure_authenticated, :only => [:index, :new, :create, :edit, :update]

  def show
    @package = Package.find(params[:id])
  end

  def index
    @packages = current_maintainer.packages
  end

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

  def edit
    @package = current_maintainer.packages.find(params[:id])
  end

  def update
    @package = current_maintainer.packages.find(params[:id])
    if @package.update_attributes(params[:package])
      redirect_to packages_path(@package)
    else
      render :edit
    end
  end
end
