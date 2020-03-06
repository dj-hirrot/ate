class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: []
  def top
  end
end
