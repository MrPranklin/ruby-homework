class User < ApplicationRecord
  has_many :comments, foreign_key: author_id

  validates :email, uniqueness:{ scope: :username } , presence: true
end
