class UnidadOrdenacion::BloqueOrdenacionsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  before_action :set_bloque_ordenacion, only: [:show, :edit, :update, :destroy]

  def index
    @bloque_ordenacions = BloqueOrdenacion.all
  end

  def show

  end

  def new
    @bloque_ordenacion = BloqueOrdenacion.new
  end

  def create
    @bloque_ordenacion = BloqueOrdenacion.new(bloque_ordenacion_params)
    respond_to do |format|
      if @bloque_ordenacion.save

        format.html { redirect_to unidad_ordenacion_bloque_ordenacions_path, notice: 'Bloque de Ordenación creado satisfactoriamente.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @bloque_ordenacion.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @bloque_ordenacion.update(bloque_ordenacion_params)
        format.html { redirect_to unidad_ordenacion_bloque_ordenacions_path, notice: 'Bloque de Ordenación actualizado satisfactoriamente.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bloque_ordenacion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bloque_ordenacion.destroy
    respond_to do |format|
      format.html { redirect_to unidad_ordenacion_bloque_ordenacions_path, notice:  'Bloque de Ordenación eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end


  private
    def bloque_ordenacion_params
      params.require(:bloque_ordenacion).permit(:nombre, :abreviado, :unidad_ordenacion_id, :area, :descripcion)
    end

    def set_bloque_ordenacion
      @bloque_ordenacion = BloqueOrdenacion.find_by(id: params_id)
    end


end