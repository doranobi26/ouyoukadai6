class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: { maximum: 50 }
  validates :name, length: { maximum: 20 }
  validates :name, length: { minimum: 2 }
  validates :name, presence: true
  attachment :profile_image

  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #既にいいねしているかどうか
  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
