class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def store_location(l)
    session[:stored_location] = l
  end

  def stored_location
    session[:stored_location]
  end

  def clear_stored_location!
    session[:stored_location] = nil
  end

  def redirect_back_or(or_url)
    redirect_to(stored_location || or_url)
    clear_stored_location!
  end

  def current_maintainer
    @_current_maintainer ||= Maintainer.find(session[:maintainer_id])
  end

  def signed_in?
    session[:maintainer_id].present?
  end
  helper_method :signed_in?
end
