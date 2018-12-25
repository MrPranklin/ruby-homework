class AddMissingIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :sub_reddits, :title, unique: true
  end
end
