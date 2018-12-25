class ChangeTitleColumnInPost < ActiveRecord::Migration[5.2]
  def change
    # I believe I had to first remove this column because I had nulls in old column
    remove_column :posts, :title
    add_column :posts, :title, :string, null: false, default: ""
    add_index :posts, :title, unique: true
  end
end
