FactoryBot.define do
  factory :item do
    category_id {2}
    product_stats_id {2}
    delivery_change_burden_id {2}
    prefecture_id {2}
    delivery_date_id {2}
    product_name {"うまい鮨勘"}
    product_description {"とにかく安くてうまい"}
    price {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end