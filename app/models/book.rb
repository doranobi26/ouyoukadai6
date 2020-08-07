class Book < ApplicationRecord


	validates :title, presence: true
	validates :body, presence: true
	validates :title, length: { maximum: 200 }
	validates :body,  length: { maximum: 200 }


	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
