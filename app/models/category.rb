class Category < ActiveRecord::Base

  attr_accessible :name

  belongs_to :categories,
             :class_name => "Category",
             :foreign_key => "parent_id"

  has_many :categories,
           :class_name => "Category",
           :foreign_key => "parent_id"

  has_many :news,
           :class_name => "News"

end
