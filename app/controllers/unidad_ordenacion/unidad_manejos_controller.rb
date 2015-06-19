class UnidadOrdenacion::UnidadManejosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bloque_ordenacion, except: [:index_all]
  load_and_authorize_resource
  before_action :set_unidad_manejo, only: [:show, :edit, :update, :destroy]

  def index
    @unidad_manejos = @bloque_ordenacion.unidad_manejos
  end

  def new
    @unidad_manejo = @bloque_ordenacion.unidad_manejos.build
  end

  def create
    @unidad_manejo = @bloque_ordenacion.unidad_manejos.build(unidad_manejo_params)
    respond_to do |format|
      if @unidad_manejo.save
        format.html { redirect_to unidad_ordenacion_unidad_manejos_path(bo: @bloque_ordenacion), notice: 'Subcuenca creada satisfactoriamente.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @unidad_manejo.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @unidad_manejo.update(unidad_manejo_params)
        format.html { redirect_to unidad_ordenacion_unidad_manejos_path, notice: 'Subcuenca actualizada satisfactoriamente.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unidad_manejo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if User.where(unidad_manejo_id: @unidad_manejo.id).nil?
      @unidad_manejo.destroy
      respond_to do |format|
        flash[:warning] =  'Subcuenca eliminada satisfactoriamente.'
        format.html { redirect_to unidad_ordenacion_unidad_manejos_path }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        flash[:alert] =  'No se puede eliminar la Subcuenca dado que hay usuarios asociados a esta.'
        format.html { redirect_to unidad_ordenacion_unidad_manejos_path }
        format.json { head :no_content }
      end
    end
  end

  def index_all
    @unidad_manejos = UnidadManejo.all
  end

  def new_all
    @unidad_manejo = UnidadManejo.new
  end

  def create_all
    @unidad_manejo = UnidadManejo.new(unidad_manejo_params.merge(bloque_ordenacion_id: params[:unidad_manejo][:bloque_ordenacion_id]))
    respond_to do |format|
      if @unidad_manejo.save
        format.html { redirect_to unidad_ordenacion_unidad_manejo_new_all_path, notice: 'Subcuenca creada satisfactoriamente.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @unidad_manejo.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    def set_unidad_manejo
     @unidad_manejo = @bloque_ordenacion.unidad_manejos.find_by(id: params_id)
    end

    def set_bloque_ordenacion
      @bloque_ordenacion = BloqueOrdenacion.find_by(id: ActionController::Parameters.new(bo: params[:bo]).permit(:bo)[:bo])
    end

    def unidad_manejo_params
      params.require(:unidad_manejo).permit(:nombre, :abreviado, :nro_providencia, :fecha_otorgacion, :fecha_vence, :area, :ubicacion, :descripcion, :doc_providencia, :doc_plan_forestal, :tipo_bosque_id, municipio_ids:[])
    end
end