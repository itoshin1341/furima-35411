FactoryBot.define do
  factory :purchaser_address do
    postal_code {"984-0812"}
    prefecture_id {5}
    city {"仙台市"}
    block {"若林区五十人町"}
    building_name {"プレジデント大盛"}
    phone_number {"09087458425"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
