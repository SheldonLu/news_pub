class CreatePushNews < ActiveRecord::Migration
  def change
    create_table :push_news do |t|
      t.datetime :push_datetime
      t.string :status

      t.timestamps

    end
  end
end