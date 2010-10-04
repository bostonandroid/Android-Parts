class SessionsController < ApplicationController
  def new
  end

  def create
    if resp = request.env['rack.openid.response']
      if resp.status == :success
        handle_maintainer(resp.display_identifier)
      else
        flash[:failure] = "OpenID authentication failed: #{resp.status}"
        render :new
      end
    else
      openid_header = Rack::OpenID.build_header(
        :identifier => params['openid_identifier'])
      response.headers['WWW-Authenticate'] = openid_header
      render :nothing => true, :status => 401
    end
  end

  def destroy
    session[:maintainer_id] = nil
    redirect_to root_url
  end

  protected

  def handle_maintainer(openid)
    maintainer = Maintainer.find_by_openid_identifier(openid)
    if maintainer && maintainer.complete?
      session[:maintainer_id] = maintainer.id
      redirect_back_or root_url
    else
      maintainer ||= Maintainer.create!(:openid_identifier => openid)
      session[:maintainer_id] = maintainer.id
      redirect_to edit_maintainer_url(maintainer)
    end
  end
end
