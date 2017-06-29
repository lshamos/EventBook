class UsersController < ApplicationController
  def index
@users = User.all

  end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @event = Event.new

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to user_path @user.id
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to user_path
    else redirect_to edit_user_path
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
