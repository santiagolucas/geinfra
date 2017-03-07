require 'test_helper'

class RedesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rede = redes(:one)
  end

  test "should get index" do
    get redes_url
    assert_response :success
  end

  test "should get new" do
    get new_rede_url
    assert_response :success
  end

  test "should create rede" do
    assert_difference('Rede.count') do
      post redes_url, params: { rede: { ativa: @rede.ativa, controle_mac: @rede.controle_mac, controle_usuario: @rede.controle_usuario, descricao: @rede.descricao, grupo_ad: @rede.grupo_ad, nome: @rede.nome } }
    end

    assert_redirected_to rede_url(Rede.last)
  end

  test "should show rede" do
    get rede_url(@rede)
    assert_response :success
  end

  test "should get edit" do
    get edit_rede_url(@rede)
    assert_response :success
  end

  test "should update rede" do
    patch rede_url(@rede), params: { rede: { ativa: @rede.ativa, controle_mac: @rede.controle_mac, controle_usuario: @rede.controle_usuario, descricao: @rede.descricao, grupo_ad: @rede.grupo_ad, nome: @rede.nome } }
    assert_redirected_to rede_url(@rede)
  end

  test "should destroy rede" do
    assert_difference('Rede.count', -1) do
      delete rede_url(@rede)
    end

    assert_redirected_to redes_url
  end
end
