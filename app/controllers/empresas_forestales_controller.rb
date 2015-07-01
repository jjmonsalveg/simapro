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

    if @empresa_forestal.save
      format.html { redirect_to empresas_forestales_path, notice:  'Empresa Forestal Creada satisfactoriamente.' }
    else
      render 'empresas_forestales/new'
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

  def default_or_value_view(param, value)
    param.nil? ? value : param
  end

  helper_method :default_or_value_view

  private
  def empresa_forestal_params
    params.require(:empresa_forestal).permit(:nombre, :abreviado, :rif, :direccion_fiscal, :telefono,
                                             :pais_id,:parcela_manejo_long,:parcela_manejo_ancho,:parcela_inv_long,
                                             :parcela_inv_ancho,:area_parcela_inv,:cuadricula_inv_long,
                                             :cuadricula_inv_ancho,:area_cuadricula_inv)
  end
end
