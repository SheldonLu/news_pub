class AddCategoriesIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :categories_id, :integer
    add_index :news, :categories_id
  end
end
