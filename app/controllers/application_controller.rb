class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def store_location(l)
    session[:stored_location] = l
  end

  def store_location!
    store_location(url_for)
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

  def signed_out?
    !signed_in?
  end

  def ensure_authenticated
    if signed_out?
      store_location!
      flash[:failure] = 'You must be signed in.'
      redirect_to new_session_url
    end
  end
end
