class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name,
                :phone_number, :purchaser_history, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: 
              {with: /\A[0-9]{3}-[0-9]{4}\z/,
               message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :phone_number, format:
              {with: /\A\d{10,11}\z/, message: "is too short"}
    validates :token
  end
  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :block, presence: true


  def save
    purchaser_history = PurchaserHistory.create(user_id: user_id, item_id: item_id)
    Purchaser.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, 
                    building_name: building_name, phone_number: phone_number, purchaser_history_id: purchaser_history.id)
  end
end