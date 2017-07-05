class InicialController < ApplicationController
  def index
    @contacts = Contact.order('created_at desc').page(params[:page]).per(5)
    @kinds = Kind.order('created_at desc').limit(5)
  end
end
