class BookCommentsController < ApplicationController
	def create
		book_comment = current_user.book_comments.new(book_comments_params)
		book_comment.book_id = params[:book_id]
		respond_to do |format|
			if book_comment.save!
				format.html { redirect_to book_path(book_comment.book) }
				format.js
			end
		end
		@book = Book.find(params[:book_id])
		@book_comments = @book.book_comments
		
	end


	def destroy
		book_comment = BookComment.find(params[:id])
		respond_to do |format|
			if book_comment.destroy
				format.html { redirect_to book_path(book_comment.book) }
				format.js
			end
		end
		@book = Book.find(params[:book_id])
		@book_comments = @book.book_comments
	end

	private
	def book_comments_params
		params.require(:book_comment).permit(:body)
	end
end
