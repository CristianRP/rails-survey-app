class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def landing_page; end
end
