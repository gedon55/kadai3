class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    @user=update(user_params)
    redirect_to users_path
  end

  def index
    @users =User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
end

private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
