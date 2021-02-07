class SearchController < ApplicationController
  def search_contents
    if params[:search_model].to_i == 0
      @contents = User.search_users(params[:search_word], params[:search_level].to_i)
    elsif params[:search_model].to_i == 1
      @contents = Book.search_books(params[:search_word], params[:search_level].to_i)
    end
  end
end
