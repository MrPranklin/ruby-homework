class ChangeAuthorIdInPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :author_id, :integer null: false
  end
end
