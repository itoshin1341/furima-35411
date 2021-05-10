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

  validates :category_id, numericality: { other_than: 1 }
  validates :product_stats_id, numericality: { other_than: 1 }
  validates :delivery_change_burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }


end
