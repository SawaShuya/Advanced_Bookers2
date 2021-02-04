class BookCommentsController < ApplicationController
	def create
		book_comment = current_user.book_comments.new(book_comments_params)
		book_comment.book_id = params[:book_id]
		book_comment.save
		redirect_to book_path(book_comment.book)
	end


	def destroy
	end

	private
	def book_comments_params
		params.require(:book_comment).permit(:body)
	end
end
