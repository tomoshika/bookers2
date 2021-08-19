class UsersController < ApplicationController
  
  def new
    @book = @user.book.new(book_params)
  end
  
  def create
    @book = @user.book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def destroy
  end
  
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
