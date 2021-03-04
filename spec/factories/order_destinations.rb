FactoryBot.define do
  factory :order_destination do
    postal_code        { '111-1111' }
    shipping_place_id  { 7 }
    city               { '横浜市' }
    address            { '青葉区' }
    tell_number        { "09011111111" }
    token              { "tok_abcdefghijk00000000000000000" }
  end
end
