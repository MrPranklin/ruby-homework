# == Schema Information
#
# Table name: upvotes
#
#  id         :integer          not null, primary key
#  creator    :string           not null
#  post       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer
#  post_id    :integer
#

class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, presence: true
  validates :creator, uniqueness: true, presence: true
end
