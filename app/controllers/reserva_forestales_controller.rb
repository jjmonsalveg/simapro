class ReservaForestalesController < ApplicationController
  before_action :set_reserva_forestal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reserva_forestales = ReservaForestal.all
    respond_with(@reserva_forestales)
  end

  def show
    respond_with(@reserva_forestal)
  end

  def new
    @reserva_forestal = ReservaForestal.new
    respond_with(@reserva_forestal)
  end

  def edit
  end

  def create
    @reserva_forestal = ReservaForestal.new(reserva_forestal_params)
    @reserva_forestal.save
    respond_with(@reserva_forestal)
  end

  def update
    @reserva_forestal.update(reserva_forestal_params)
    respond_with(@reserva_forestal)
  end

  def destroy
    @reserva_forestal.destroy
    respond_with(@reserva_forestal)
  end

  private
    def set_reserva_forestal
      @reserva_forestal = ReservaForestal.find(params[:id])
    end

    def reserva_forestal_params
      params.require(:reserva_forestal).permit(:empresa_forestal_id, :nombre, :abreviado, :fecha_creacion, :fecha_reglamento, :area, :descripcion)
    end
end
