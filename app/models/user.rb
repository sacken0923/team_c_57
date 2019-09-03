class User < ApplicationRecord
  # registration1
  validates :nickname, presence: true,on: :validates_registration1
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, uniqueness: true,format: { with: VALID_EMAIL_REGEX },on: :validates_registration1
  validates :password, presence: true,on: :validates_registration1
  validates :password_confirmation, presence: true ,on: :validates_registration1
  validates :first_name, presence: true,on: :validates_registration1
  validates :last_name, presence: true,on: :validates_registration1
  validates :kana_first_name, presence: true,on: :validates_registration1
  validates :kana_last_name, presence: true,on: :validates_registration1
  validates :year, presence: true,on: :validates_registration1
  validates :month, presence: true,on: :validates_registration1
  validates :day, presence: true,on: :validates_registration1
  # registration2
  validates :tell, presence: true,on: :validates_registration2
  # registration3
  validates :address_last_name, presence: true,on: :validates_registration3
  validates :address_first_name, presence: true,on: :validates_registration3
  validates :kana_address_last_name, presence: true,on: :validates_registration3
  validates :kana_address_first_name, presence: true,on: :validates_registration3
  validates :prefecture, presence: true,on: :validates_registration3
  validates :postal_code, presence: true,on: :validates_registration3
  validates :city, presence: true,on: :validates_registration3
  validates :address, presence: true,on: :validates_registration3
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :cards
  # accepts_nested_attributes_for :cards
end
