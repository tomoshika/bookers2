class UsersController < ApplicationController

  def new
    @book = @user.book.new(book_params)
  end

  def create
    @book = @user.book.new(book_params)
   if @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
   else
    redirect_to books_path
   end
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
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
