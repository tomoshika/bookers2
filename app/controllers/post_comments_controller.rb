class PostCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @post_comment = PostComment.new
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = @book.id
    comment.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = @book.post_comments.find(params[:id])

   if current_user.id == comment.user.id
      comment.destroy
      # redirect_back(fallback_location: root_path)
   else
      redirect_to "books/show"
   end
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
