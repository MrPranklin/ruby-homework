# frozen_string_literal: true

class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.string :creator, null: false
      t.string :post, null: false

      t.timestamps
    end
    add_reference :upvotes, :creator,
                  foreign_key: { to_table: :users, on_delete: :cascade }
    add_reference :upvotes, :post,
                  foreign_key: { to_table: :posts, on_delete: :cascade }
    add_index :upvotes, :creator, unique: true
  end
end
