class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :publisher
      t.string :source
      t.string :release
      t.string :is_top
      t.string :summary
      t.string :content
      t.datetime :push_datetime

      t.timestamps

    end
  end
end
