require 'test_helper'

class HostHistoricosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @host_historico = host_historicos(:one)
  end

  test "should get index" do
    get host_historicos_url
    assert_response :success
  end

  test "should get new" do
    get new_host_historico_url
    assert_response :success
  end

  test "should create host_historico" do
    assert_difference('HostHistorico.count') do
      post host_historicos_url, params: { host_historico: { descricao: @host_historico.descricao, host_id: @host_historico.host_id, motivo: @host_historico.motivo, nova_situacao: @host_historico.nova_situacao, novo_status: @host_historico.novo_status, rede_id: @host_historico.rede_id, usuario_id: @host_historico.usuario_id } }
    end

    assert_redirected_to host_historico_url(HostHistorico.last)
  end

  test "should show host_historico" do
    get host_historico_url(@host_historico)
    assert_response :success
  end

  test "should get edit" do
    get edit_host_historico_url(@host_historico)
    assert_response :success
  end

  test "should update host_historico" do
    patch host_historico_url(@host_historico), params: { host_historico: { descricao: @host_historico.descricao, host_id: @host_historico.host_id, motivo: @host_historico.motivo, nova_situacao: @host_historico.nova_situacao, novo_status: @host_historico.novo_status, rede_id: @host_historico.rede_id, usuario_id: @host_historico.usuario_id } }
    assert_redirected_to host_historico_url(@host_historico)
  end

  test "should destroy host_historico" do
    assert_difference('HostHistorico.count', -1) do
      delete host_historico_url(@host_historico)
    end

    assert_redirected_to host_historicos_url
  end
end
