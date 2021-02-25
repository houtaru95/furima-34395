class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_day, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_kana, presence: true
    validates :first_name_kana, presence: true
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英数字混合にしてください' }
end
