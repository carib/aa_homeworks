class UsersController < ApplicationController
  
  before_action :redirect_if_not_signed_in, only: :show
  
  has_many :cat_rental_requests,
    class_name: :CatRentalRequest,
    foreign_key: :user_id
  
  def new
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to cats_url
    else
      flash.now[:errors] = user.errors.full_message
      render :new
    end
  end
  
  def redirect_if_not_signed_in
    redirect_to cats_url unless current_user && current_user.id == params[:id].to_i
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
