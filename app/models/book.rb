class Book < ApplicationRecord 
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end


	def self.search_books(word, level)
    if level == 0
      @contens = Book.where(["title LIKE?", "#{word}"])
    elsif level == 1
      @contens = Book.where(["title LIKE?", "#{word}%"])
    elsif level == 2
      @contens = Book.where(["title LIKE?", "%#{word}"])
    elsif level == 3
      @contens = Book.where(["title LIKE?", "%#{word}%"])
    end
  end

end
