class Admin::ApplicationController < ActionController::Base
  before_action :admin?

  layout 'admin/application'

  private
    def admin?
      unless current_user && current_user.role == "admin"
        render 'error/404', status: :not_found
      end
    end
end
