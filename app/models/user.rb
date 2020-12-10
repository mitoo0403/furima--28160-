class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  Full_width_name = /\A[ぁ-んァ-ン一-龥]/
  Full_width_kana = /\A[ァ-ヶー－]+\z/
 
  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :nickname
    validates :first_name, format: { with: Full_width_name }
    validates :first_name_kana, format: { with: Full_width_kana }
    validates :last_name, format: { with: Full_width_name }
    validates :last_name_kana, format: { with: Full_width_kana }
    validates :birthday
  end
end