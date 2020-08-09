class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :book
  #バリデーション
  validates :comment, presence: true

end
