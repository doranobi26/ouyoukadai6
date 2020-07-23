class Book < ApplicationRecord


	validates :title, presence: true
	validates :body, presence: true
	validates :title, length: { maximum: 200 }
	validates :body,  length: { maximum: 200 }


	belongs_to :user
	
end
