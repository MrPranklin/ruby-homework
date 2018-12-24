# == Schema Information
#
# Table name: sub_reddits
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  private     :boolean          default(FALSE), not null
#  owner_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubReddit < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :title, presence: true, uniqueness: true
  validates :owner, presence: true
  validates :description, presence: true
end
