class User < ApplicationRecord
  # registration1
  validates :nickname,                presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email,                   presence: true, uniqueness: true,format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: { in: 7..128 } 
  validates :password_confirmation,   presence: true, length: { in: 7..128 }
  validates :first_name,              presence: true
  validates :last_name,               presence: true
  validates :kana_first_name,         presence: true
  validates :kana_last_name,          presence: true
  validates :year,                    presence: true
  validates :month,                   presence: true
  validates :day,                     presence: true
  # registration2
  validates :tell,                    presence: true
  # registration3
  validates :address_last_name,       presence: true
  validates :address_first_name,      presence: true
  validates :kana_address_last_name,  presence: true
  validates :kana_address_first_name, presence: true
  validates :prefecture,              presence: true
  validates :postal_code,             presence: true
  validates :city,                    presence: true
  validates :address,                 presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :cards
  # accepts_nested_attributes_for :cards
end
# user = User.create(nickname: "aa")