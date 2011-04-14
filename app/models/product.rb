class Product < ActiveRecord::Base
  validates :title, :presence =>true
  validates :description, :presence =>true
  validates :image_url, :presence =>true
  validates :price , :presence =>true,
                     :numericality =>{:message =>'must be a numer'}
  validates :image_url, :format => { :with =>%r{\.(gif|jpg|png)$}i, :message =>'must be a url for gif,jpg or png image'}
  validate :price_must_be_at_least_a_acent
  
  protected  
  def price_must_be_at_least_a_acent
    errors.add(:price,'should be at least 0.01') if price.nil?|| price<0.01
  end
  default_scope :order => 'title'
  has_many :line_items
  #before_destroy :ensure_not_referenced_by_any_line_item
  # ensure that there are no line items referencing this product
 # def ensure_not_referenced_by_any_line_item
    before_destroy :ensure_not_referenced_by_any_line_item
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Line Items present"  #这是什么意思
      return false
    end
  end
end

#before_destroy :ensure_not_referenced_by_any_line_item
# ensure that there are no line items referencing this product
#def ensure_not_referenced_by_any_line_item
