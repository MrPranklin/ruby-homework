# frozen_string_literal: true

class AddSubRedditIdColumnInPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_reddit_id
    add_reference :posts, :sub_reddit,
                  foreign_key: { to_table: :sub_reddits, on_delete: :cascade }
  end
end
