class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :mob_no, presence: true
  has_many :users, :dependent => :destroy
  has_many :food_fees, :dependent => :destroy
  has_one :food_fee, -> { where(:status => "Active") }
  has_many :user_fees, :dependent => :destroy

  enum role: {"admin": "admin", "user": "user"}
end
