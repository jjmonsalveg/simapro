require 'test_helper'

class ReservaForestalesControllerTest < ActionController::TestCase
  setup do
    @reserva_forestal = reserva_forestales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserva_forestales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserva_forestal" do
    assert_difference('ReservaForestal.count') do
      post :create, reserva_forestal: { abreviado: @reserva_forestal.abreviado, area: @reserva_forestal.area, descripcion: @reserva_forestal.descripcion, empresa_forestal_id: @reserva_forestal.empresa_forestal_id, fecha_creacion: @reserva_forestal.fecha_creacion, fecha_reglamento: @reserva_forestal.fecha_reglamento, nombre: @reserva_forestal.nombre }
    end

    assert_redirected_to reserva_forestal_path(assigns(:reserva_forestal))
  end

  test "should show reserva_forestal" do
    get :show, id: @reserva_forestal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserva_forestal
    assert_response :success
  end

  test "should update reserva_forestal" do
    patch :update, id: @reserva_forestal, reserva_forestal: { abreviado: @reserva_forestal.abreviado, area: @reserva_forestal.area, descripcion: @reserva_forestal.descripcion, empresa_forestal_id: @reserva_forestal.empresa_forestal_id, fecha_creacion: @reserva_forestal.fecha_creacion, fecha_reglamento: @reserva_forestal.fecha_reglamento, nombre: @reserva_forestal.nombre }
    assert_redirected_to reserva_forestal_path(assigns(:reserva_forestal))
  end

  test "should destroy reserva_forestal" do
    assert_difference('ReservaForestal.count', -1) do
      delete :destroy, id: @reserva_forestal
    end

    assert_redirected_to reserva_forestales_path
  end
end
