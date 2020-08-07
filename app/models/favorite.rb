class Favorite < ApplicationRecord
	belongs_to :book
	belongs_to :user

	validates_uniqueness_of :book_id, scope: :user_id
	#validates_uniqueness_of :user_id, scope: :book_id
	
	#一人のユーザーが同じ投稿を複数回いいねできなくするためのバリデーション
end
