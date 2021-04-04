class Comment < ApplicationRecord
  validates :comment_content, presence: true
  belongs_to :user
  belongs_to :post
end
