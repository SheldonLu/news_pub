class AddNewsIdToPushNews < ActiveRecord::Migration
  def change
    add_column :push_news, :news_id, :integer
    add_index :push_news, :news_id
  end
end
