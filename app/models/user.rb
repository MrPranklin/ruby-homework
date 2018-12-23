class User < ApplicationRecord
  has_many :comments, foreign_key: author_id

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
end
