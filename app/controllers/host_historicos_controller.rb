class HostHistoricosController < ApplicationController
  before_filter :authorize
  before_action :set_host_historico, only: [:show, :edit, :update, :destroy]

  # GET /host_historicos
  # GET /host_historicos.json
  def index
    @host_historicos = HostHistorico.all
    @filtro ||= Hash.new
    @filtro[:id] ||= "PRIMEIRAVEZ"

    unless @filtro[:id].nil? and @filtro[:id].blank? and @filtro[:id]!= "PRIMEIRAVEZ"
      @host_historicos = HostHistorico.search(params[:search])
    else
      @filtro[:id] = ""
    end
  end

  # GET /host_historicos/1
  # GET /host_historicos/1.json
  def show
  end

  # GET /host_historicos/new
  def new
    @host_historico = HostHistorico.new
    @host = Host.all
    @user = User.all
    @rede = Rede.all
  end

  # GET /host_historicos/1/edit
  def edit
    @host = Host.all
    @user = User.all
    @rede = Rede.all
  end

  # POST /host_historicos
  # POST /host_historicos.json
  def create
        @host = Host.all
    @user = User.all
    @rede = Rede.all
    @host_historico = HostHistorico.new(host_historico_params)

    respond_to do |format|
      if @host_historico.save
        format.html { redirect_to @host_historico, notice: 'Host historico was successfully created.' }
        format.json { render :show, status: :created, location: @host_historico }
      else
        format.html { render :new }
        format.json { render json: @host_historico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host_historicos/1
  # PATCH/PUT /host_historicos/1.json
  def update
    respond_to do |format|
      if @host_historico.update(host_historico_params)
        format.html { redirect_to @host_historico, notice: 'Host historico was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_historico }
      else
        format.html { render :edit }
        format.json { render json: @host_historico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host_historicos/1
  # DELETE /host_historicos/1.json
  def destroy
    @host_historico.destroy
    respond_to do |format|
      format.html { redirect_to host_historicos_url, notice: 'Host historico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_historico
      @host_historico = HostHistorico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_historico_params
      params.require(:host_historico).permit(:host_id, :nova_situacao, :novo_status, :user_id, :motivo, :descricao, :rede_id)
    end
end
