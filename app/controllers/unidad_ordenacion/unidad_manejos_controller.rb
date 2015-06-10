class UnidadOrdenacion::UnidadManejosController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_action :set_unidad_manejo, only: [:show, :edit, :update, :destroy]

  def index
    @unidad_manejos = set_unidad_manejos
  end

  private
    def set_unidad_manejo
     @unidad_manejo = set_unidad_manejos.find_by(id: params_id)
    end

    def set_unidad_manejos
      BloqueOrdenacion.find_by(id: ActionController::Parameters.new(bo: params[:bo]).permit(:bo)[:bo]).unidad_manejos
    end
end