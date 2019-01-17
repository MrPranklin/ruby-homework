# frozen_string_literal: true
# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  author_id     :integer          not null
#  content       :text
#  published     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string           default(""), not null
#  sub_reddit_id :integer
#

class Post < ApplicationRecord
  has_many :comments
  has_many :upvotes
  belongs_to :user
  belongs_to :sub_reddits

  validates :title, presence: true, uniqueness: true
  validates :sub_reddit_id, presence: true
end
