class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    # if User.all.length == 0
    #   @user.admin = true
    # end

    if @user.save
      UserMailer.signup_confirmation(@user).deliver_now
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
