class FavoritesController < ApplicationController
	before_action :redirect

	def create
		favorite = @book.favorites.new(user_id: current_user.id)
		respond_to do |format|
			if favorite.save
				format.html { redirect_to request.referer }
				format.js
			end
		end	    
	end

	def destroy
		favorite = current_user.favorites.find_by(book_id: @book.id)
		
		respond_to do |format|
			if favorite.destroy
				format.html { redirect_to request.referer }
				format.js
			end
		end
	end


	private
	def redirect
		@book = Book.find(params[:book_id])
		if params[:redirect_id].present?
			if params[:redirect_id].to_i == 0 
				@books = Book.all
				@redirect_id = 0
			elsif params[:redirect_id].to_i == 1
				@books = @book.user.books
				@redirect_id = 1
			end
		end
	end
end
