# frozen_string_literal: true

class AddSubRedditIdColumnInPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sub_reddit_id, :integer, null: false
    add_reference :posts, :sub_reddit_id,
                  foreign_key: { to_table: :sub_reddits, on_delete: :cascade }
  end
end
