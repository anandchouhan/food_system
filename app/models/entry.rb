class Entry < ApplicationRecord
	belongs_to :user
	validates :date_time, presence: true
	ENTRY_TIME = ["one_time",  "two_time"]

end
