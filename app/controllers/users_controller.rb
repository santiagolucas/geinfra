class UsersController < ApplicationController
   before_filter :authorize
   before_action :set_user, only: [:show, :edit, :update, :destroy]


   def index
     @filtro ||= Hash.new
     @filtro[:nome] ||= "PRIMEIRAVEZ"

    unless @filtro[:nome].nil? and @filtro[:nome].blank? and @filtro[:nome]!= "PRIMEIRAVEZ"
      @users = User.search(params[:search])
    else
      @filtro[:nome] = ""
    end
   end

  def new
    @user = User.new
  end

  def show
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

    def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

   def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :nome, :situacao)
  end
end
