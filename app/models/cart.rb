class Cart < ActiveRecord::Base
  has_many :line_items, :dependent=> :destroy   #与cart级联删除
  def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id=>product_id)
      line_items << current_item
    end
    current_item
  end
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  def total_items    #计算当前购物车中的商品总数量，create
    line_items.sum(:quantity)
  end
end
