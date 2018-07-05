class HomeController < ApplicationController

  def index
    @projects = Project.order(position: :asc)
  end

end
