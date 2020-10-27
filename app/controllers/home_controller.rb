class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :about, :staff]

  def about
  end

  def staff
  end

  def after_sign_in_path_for(resource)
    app_dashboard_index_path
  end
end
