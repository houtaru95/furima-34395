class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :shipping_place
  belongs_to :shipping_days

  belongs_to :user
  has_one_attached :image

  with_options presence: true, numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :shipping_days_id
  end

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :item_price
  end

  validates :item_name, length: { maximum: 40 }           # 文字数制限(40字まで)
  validates :item_description, length: { maximum: 1000 }  # 文字数制限(1000字まで)

  validates :item_price, format: { with: /\A[0-9]+\z/ }               # ¥半角数字のみ
  validates_inclusion_of :item_price, in: 300..9999999                 # ¥300~¥9,999,999まで


end
