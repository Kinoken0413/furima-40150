class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :building, allow_blank: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :token
  end
  
  validate :validate_phone_number_length

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Delivery.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end

  def validate_phone_number_length
    unless phone_number.nil?
      if phone_number.length < 10
        errors.add(:phone_number, "is too short")
      elsif phone_number.length > 11
        errors.add(:phone_number, "is too long")
      end
    end
  end

end