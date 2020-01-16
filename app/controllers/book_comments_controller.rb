class BookCommentsController < ApplicationController

def create
	book = Book.find(params[:book_id])
	comment = BookComment.new(book_comment_params)
	comment.user_id = current_user.id
	comment.book_id = book.id
	comment.save
	redirect_to book_path(book)
end

def destroy

	comment = BookComment.find(params[:book_id])
	comment.destroy
	redirect_to book_path(comment.book)
end

private
def book_comment_params
	params.require(:book_comment).permit(:user_id,:book_id,:comment)
end

end