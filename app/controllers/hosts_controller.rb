class HostsController < ApplicationController
  before_filter :authorize
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
    @filtro ||= Hash.new
    @filtro[:mac] ||= "PRIMEIRAVEZ"

    unless @filtro[:mac].nil? and @filtro[:mac].blank? and @filtro[:mac]!= "PRIMEIRAVEZ"
      @hosts = Host.search(params[:search])
    else
      @filtro[:mac] = ""
    end

   # if params[:search]
    #  @hosts = Host.search(params[:search])
    #else
    #@hosts = Host.all
    #end

  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(host_params)

    respond_to do |format|
      if @host.save
        format.html { redirect_to @host, notice: 'Host criado com sucesso!!' }
        format.json { render :show, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:mac, :nome, :descricao, :ativo, :validade)
    end
end
