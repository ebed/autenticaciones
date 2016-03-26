require 'test_helper'

class TestInstancesControllerTest < ActionController::TestCase
  setup do
    @test_instance = test_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_instance" do
    assert_difference('TestInstance.count') do
      post :create, test_instance: { fecha: @test_instance.fecha, ficha_id: @test_instance.ficha_id, test_id: @test_instance.test_id }
    end

    assert_redirected_to test_instance_path(assigns(:test_instance))
  end

  test "should show test_instance" do
    get :show, id: @test_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_instance
    assert_response :success
  end

  test "should update test_instance" do
    patch :update, id: @test_instance, test_instance: { fecha: @test_instance.fecha, ficha_id: @test_instance.ficha_id, test_id: @test_instance.test_id }
    assert_redirected_to test_instance_path(assigns(:test_instance))
  end

  test "should destroy test_instance" do
    assert_difference('TestInstance.count', -1) do
      delete :destroy, id: @test_instance
    end

    assert_redirected_to test_instances_path
  end
end
