# frozen_string_literal: true
# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  author_id     :integer
#  content       :text
#  published     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  sub_reddit_id :integer
#  title         :string
#

class Post < ApplicationRecord
  has_many :comments
  belongs_to :sub_reddits

  validates :title, presence: true, uniqueness: true
  validates :sub_reddit_id, presence: true
end
