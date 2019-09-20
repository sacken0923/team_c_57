class User < ApplicationRecord
  # registration1
  validates :nickname,                presence: true
  validates :email,                   presence: true, uniqueness: true #,format: { with:/\A[\w.ー]+[^.]@[\w.ー]+\z/ }
  validates :password,                presence: true, length: { in: 7..128 } #,format:{with:[\w]}
  validates :password_confirmation,   presence: true, length: { in: 7..128 }
  validates :first_name,              presence: true
  validates :last_name,               presence: true
  validates :kana_first_name,         presence: true
  validates :kana_last_name,          presence: true
  validates :year,                    presence: true
  validates :month,                   presence: true
  validates :day,                     presence: true
  # registration2
  validates :tell,                    presence: true  #, format: { with: /\A0[7-9]0-\d{4}-\d{4}\z/ }
  # registration3
  validates :address_last_name,       presence: true
  validates :address_first_name,      presence: true
  validates :kana_address_last_name,  presence: true
  validates :kana_address_first_name, presence: true
  validates :prefecture,              presence: true
  validates :postal_code,             presence: true #, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :city,                    presence: true
  validates :address,                 presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :cards
end