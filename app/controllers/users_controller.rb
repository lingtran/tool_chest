class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "Welcome, #{@user.name}!"
    else
      render :new
      flash[:error] = @user.errors.full_messages.join(", ")
    end
  end

  def show
    @user = User.find(params[:id])
    @tools = @user.tools
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
