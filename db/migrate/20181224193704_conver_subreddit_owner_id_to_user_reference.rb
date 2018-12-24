# frozen_string_literal: true

class ConverSubredditOwnerIdToUserReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :sub_reddits, :owner_id
    add_reference :sub_reddits, :owner,
                  foreign_key: { to_table: :users, on_delete: :cascade }, null: false
  end
end
