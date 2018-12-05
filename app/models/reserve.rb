class Reserve < ActiveRecord::Base
	validates :date, uniqueness: true
	
	belongs_to :residence, autosave: true
	belongs_to :user, autosave: true
end
