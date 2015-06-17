class UnidadOrdenacion::BloqueManejosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :check_user_subcuenca

  def index
    @bloque_manejos = current_user.unidad_manejo.bloque_manejos
  end

  def new
    @bloque_manejo = BloqueManejo.new
  end

  def create
    @bloque_manejo = current_user.unidad_manejo.bloque_manejos.build(bloque_manejo_params)
    respond_to do |format|
      if @bloque_manejo.save

        format.html { redirect_to unidad_ordenacion_bloque_manejos_path, notice: 'Bloque de manejo creado satisfactoriamente.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @bloque_manejo.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def check_user_subcuenca
      redirect_to settings_path, notice: 'Debe de asignar una subcuenca al usuario primero.' and return if current_user.unidad_manejo_id.nil?
    end

    def bloque_manejo_params
      params.require(:bloque_manejo).permit(:codigo, :area, parcela_manejos_attributes: [:codigo, :area])
    end
end