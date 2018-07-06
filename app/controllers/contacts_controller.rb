class ContactsController < ApplicationController

  layout false

  def create
    @contact = Contact.new contact_params
    render 'error' unless @contact.save
  end

  private

  def contact_params
    params.fetch(:contact, {}).permit Contact.permitted_params
  end

end
