class UnidadOrdenacion::UnidadManejosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bloque_ordenacion
  # load_and_authorize_resource
  # before_action :set_unidad_manejo, only: [:show, :edit, :update, :destroy]

  def index
    @unidad_manejos = @bloque_ordenacion.unidad_manejos
  end

  def new
    @unidad_manejo = @bloque_ordenacion.unidad_manejos.build
  end

  private
    def set_unidad_manejo
     @unidad_manejo = @bloque_ordenacion.unidad_manejos.find_by(id: params_id)
    end

    def set_bloque_ordenacion
      puts "PARAMS"
      puts params[:bo]
      @bloque_ordenacion = BloqueOrdenacion.find_by(id: ActionController::Parameters.new(bo: params[:bo]).permit(:bo)[:bo])
    end
end