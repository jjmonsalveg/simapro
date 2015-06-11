require 'test_helper'

class UnidadOrdenacionesControllerTest < ActionController::TestCase
  setup do
    @unidad_ordenacion = unidad_ordenaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidad_ordenaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidad_ordenacion" do
    assert_difference('UnidadOrdenacion.count') do
      post :create, unidad_ordenacion: { area: @unidad_ordenacion.area, codigo: @unidad_ordenacion.codigo, descripcion: @unidad_ordenacion.descripcion, fecha_otorgacion: @unidad_ordenacion.fecha_otorgacion, fecha_vence: @unidad_ordenacion.fecha_vence, nro_contrato: @unidad_ordenacion.nro_contrato, reserva_forestal_id: @unidad_ordenacion.reserva_forestal_id }
    end

    assert_redirected_to unidad_ordenacion_path(assigns(:unidad_ordenacion))
  end

  test "should show unidad_ordenacion" do
    get :show, id: @unidad_ordenacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unidad_ordenacion
    assert_response :success
  end

  test "should update unidad_ordenacion" do
    patch :update, id: @unidad_ordenacion, unidad_ordenacion: { area: @unidad_ordenacion.area, codigo: @unidad_ordenacion.codigo, descripcion: @unidad_ordenacion.descripcion, fecha_otorgacion: @unidad_ordenacion.fecha_otorgacion, fecha_vence: @unidad_ordenacion.fecha_vence, nro_contrato: @unidad_ordenacion.nro_contrato, reserva_forestal_id: @unidad_ordenacion.reserva_forestal_id }
    assert_redirected_to unidad_ordenacion_path(assigns(:unidad_ordenacion))
  end

  test "should destroy unidad_ordenacion" do
    assert_difference('UnidadOrdenacion.count', -1) do
      delete :destroy, id: @unidad_ordenacion
    end

    assert_redirected_to unidad_ordenaciones_path
  end
end
