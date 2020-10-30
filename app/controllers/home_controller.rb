class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :about, :staff]

  def about #static page, everyone can access this.
  end

  def staff #static page, everyone can access this
  end

  def after_sign_in_path_for(resource)
    app_dashboard_index_path
    # request.env['omniauth.origin'] || root_path
  end
end
