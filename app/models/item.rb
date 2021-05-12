class Item < ApplicationRecord

  belongs_to :user
  has_one :purchaser_history

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :category
  belongs_to :product_stats
  belongs_to :delivery_change_burden
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :product_stats_id
    validates :delivery_change_burden_id
    validates :prefecture_id
    validates :delivery_date_id
  end

  validates :price, presence: true, numericality:
            {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :image
  end
end