class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, presence: true
  validates :creator, uniqueness: true, presence: true
end
