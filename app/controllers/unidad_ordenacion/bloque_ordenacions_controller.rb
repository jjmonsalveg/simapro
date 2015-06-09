class UnidadOrdenacion::BloqueOrdenacionsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource

  def index
    @bloque_ordenacions = BloqueOrdenacion.all
  end


end