class EmpresasForestalesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_empresa_forestal, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html

  def index
    @empresas_forestales = EmpresaForestal.all
    respond_with(@empresas_forestales)
  end

  def show
    respond_with(@empresa_forestal)
  end

  def new
    @empresa_forestal = EmpresaForestal.new
    respond_with(@empresa_forestal)
  end

  def edit
  end

  def create
    @empresa_forestal = EmpresaForestal.new(empresa_forestal_params)
    @empresa_forestal.save
    respond_with(@empresa_forestal) do |format|
      format.html { redirect_to empresas_forestales_path, notice:  'Empresa Forestal Creada satisfactoriamente.' }
    end
  end

  def update
    @empresa_forestal.update(empresa_forestal_params)
    respond_with(@empresa_forestal)
  end

  def destroy
    @empresa_forestal.destroy
    respond_with(@empresa_forestal)
  end

  private
    # def set_empresa_forestal
    #   @empresa_forestal = EmpresaForestal.find(params[:id])
    # end

    def empresa_forestal_params
      params.require(:empresa_forestal).permit(:nombre, :abreviado, :rif, :direccion_fiscal, :telefono, :pais_id)
    end
end
