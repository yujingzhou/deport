class Product < ActiveRecord::Base
  validates :title, :presence =>true
  validates :description, :presence =>true
  validates :image_url, :presence =>true
  validates :price , :presence =>true,
            :numericality =>{:message =>'must be a numer'}
  validate :price_must_be_at_least_a_acent
  validates_format_of:image_url,
                     :with =>%r{\.(gif|jpg|png)$}i,
                     :message =>'must be a url for gif,jpg or png image'
  protected  
    def price_must_be_at_least_a_acent
      errors.add(:price,'should be at least 0.01') if price.nil?|| price<0.01
    end
end
