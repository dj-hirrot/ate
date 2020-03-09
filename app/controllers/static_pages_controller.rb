class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: []
  def top
    return if current_user.nil?
    @categories = Category.all
  end
end
