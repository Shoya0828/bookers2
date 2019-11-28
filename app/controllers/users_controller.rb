class UsersController < ApplicationController
before_action :authenticate_user!
before_action :logged_in_user, only: [:edit, :update]

  def show
  	@user_new = User.new
  	@user = User.find(params[:id])
  	@users = User.all
  	@book = Book.new
  end

  def index
  	@book = Book.new
  	@user_new = User.new
  	@users = User.all
  end

  def create
   @user = User.new(user_params)
   if @user.save
    flash[:notice] = 'successfully created!!'
    redirect_to user_path(@user)
   end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = 'successfully updated!!'
    redirect_to user_path(@user)
   else
    render :edit
  end
  end

private
  def user_params
	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def logged_in_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to new_user_session_path
    end
  end


end
