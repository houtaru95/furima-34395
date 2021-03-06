class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_place_id, :city, :address, :building_name, :tell_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :address
    validates :tell_number, format: { with: /\A[0-9]{1,11}\z/, message: 'Input correctly' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :shipping_place_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, shipping_place_id: shipping_place_id, city: city, address: address,
                       building_name: building_name, tell_number: tell_number, order_id: order.id)
  end
end
