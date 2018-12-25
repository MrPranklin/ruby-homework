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

require 'test_helper'

class UpvoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
