class VersionsController < ApplicationController
  def new
    @package = current_maintainer.packages.find(params[:package_id])
    @version = @package.versions.build_from_prior
  end

  def create
    @package = current_maintainer.packages.find(params[:package_id])
    @version = @package.versions.build(params[:version])
    if @version.save
      redirect_to @package
    else
      render :new
    end
  end
end
