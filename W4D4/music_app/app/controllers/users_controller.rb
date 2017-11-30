class UsersController < ApplicationController
  before_action :redirect_if_not_signed_in, only: :show
  
  def new
    render :new
  end
  
  def show
    render :show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      user_sign_in!(@user)
      flash[:success] = "Welcome back!"
      render :show
    else
      flash.now[:errors] = "You must create an account to continue"
      render :new
    end    
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  def redirect_if_not_signed_in
    redirect_to links_url unless signed_in?
  end
end
