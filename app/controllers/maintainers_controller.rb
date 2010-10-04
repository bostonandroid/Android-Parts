class MaintainersController < ApplicationController
  def edit
    @maintainer = Maintainer.find(params[:id])
  end

  def update
    @maintainer = Maintainer.find(params[:id])
    if @maintainer.update_attributes(params[:maintainer])
      redirect_back_or root_url
    else
      render :edit
    end
  end
end
