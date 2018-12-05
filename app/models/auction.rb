class Auction < ActiveRecord::Base
	validates :date, uniqueness: true
	
	belongs_to :residence, autosave: true
	
	has_many :inscriptions
	has_many :users, :through => :inscriptions
end
