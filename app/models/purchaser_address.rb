class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name,
                :phone_number, :purchase_history, :price, :user_id

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchaser_history = PurchaserHistory.create(user: user, item: item)
    Purchaser.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_history: purchase_history)
  end
end