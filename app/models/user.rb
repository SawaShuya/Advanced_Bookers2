class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image, destroy: false
  has_many :books
  validates :name, presence: true, length: {maximum: 10, minimum: 2}
  validates :introduction, length: {maximum: 50}

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :following, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following_users, through: :following, source: :followed

  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followed_users, through: :followed, source: :following

end 