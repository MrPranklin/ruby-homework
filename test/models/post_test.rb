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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
