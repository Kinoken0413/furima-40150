class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validate :password_complexity
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birth_date, presence: true

  private

  def password_complexity
    return if password.blank?

    unless password.match(/\A(?=.*[a-z])(?=.*\d)[a-z\d]{6,}\z/)
      errors.add(:password, 'is invalid. Include both letters and numbers')
    end
  end
  
end
