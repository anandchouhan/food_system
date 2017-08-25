class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	validates :first_name, :last_name, :mob_no, presence: true
	validates_length_of :mob_no, :minimum => 10, :maximum => 10
	belongs_to :owner
	has_many :user_fees, :dependent => :destroy
	has_one :entry, :dependent => :destroy
end
