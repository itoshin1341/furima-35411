class Item < ApplicationRecord

  belongs_to :user
  belongs_to :purchaser_history

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :category
  belongs_to :product_stats
  belongs_to :delivery_change_burden
  belongs_to :prefecture
  belongs_to :delivery_date

end
