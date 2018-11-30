class Auction < ActiveRecord::Base
	belongs_to :residence, autosave: true
	
	has_many :inscriptions
	has_many :users, :through => :inscriptions
end
