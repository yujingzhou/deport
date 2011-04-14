class Cart < ActiveRecord::Base
  has_many :line_items, :dependent=> :destroy   #与cart级联删除
end
