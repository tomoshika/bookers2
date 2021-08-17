class BooksController < ApplicationController
  
  def new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
  end

  def destroy
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
