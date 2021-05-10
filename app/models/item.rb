class Item < ApplicationRecord

  belongs_to :user
  belongs_to :purchaser_history
  has_one_attached :image

end
