class HomeController < ApplicationController

  before_action :init_contact

  def index
    @projects = Project.order(position: :asc)
  end

  private

  def init_contact
    @contact = Contact.new
  end

end
