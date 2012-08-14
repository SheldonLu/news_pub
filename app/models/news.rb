class News < ActiveRecord::Base

  set_table_name("news")

  attr_accessible :content, :is_top, :publisher, :push_datetime, :release, :source, :summary, :title, :categories_id

  belongs_to :categories,
             :class_name => "Category"

  has_one :push_news,
          :class_name => "PushNews",
          :dependent => :destroy

  scope :unreleased, where(:release => "0")
  scope :released, where(:release => "1")

end
