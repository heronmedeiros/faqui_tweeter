class UsersController < ApplicationController
  before_action :set_user,      only: [:show, :edit, :update, :destroy]

  def index
    redirect_to :root
  end

  def show
    redirect_to :root
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: t('users.create.correct_save') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('users.create.update_save') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t('users.destroy.correct_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if logged_in?
        @user = User.find(current_user.id)
      else
        flash[:danger] = t('users.login.please')
        redirect_to login_url
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
