class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!
  before_action :set_categories

  def set_categories
    @categories = Category.all
  end
end
