class PushNews < ActiveRecord::Base

  set_table_name("push_news")

  attr_accessible :push_datetime, :status

  belongs_to :news,
             :class_name => "News"

end
