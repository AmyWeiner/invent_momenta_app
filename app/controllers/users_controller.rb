class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Your registration was successful!"
      #redirect_to current_user
      redirect_to :controller => 'profiles', :action => 'new', :id => current_user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
