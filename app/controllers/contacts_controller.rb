class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_retorna_tipos, only: [:new, :edit, :update, :create, :index]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.page(params[:page]).per(15)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.build_address
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: I18n.t('mensagem.create') }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: I18n.t('mensagem.update') }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_path, notice: I18n.t('mensagem.destroy') }
      format.json { head :no_content }
    end
  end

  def busca
    @contact_a_buscar = params[:nome]


    @contacts = Contact.where("nome like ?", "%#{@contact_a_buscar}%").page(params[:page]).per(15)
  end

  private
  def set_retorna_tipos
    @kinds = Kind.all
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:nome, :email, :kind_id, :rmk, 
        address_attributes: [:stret, :city, :number],
        phones_attributes: [:id, :phone, :_destroy])
    end
end
