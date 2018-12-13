class Auction < ActiveRecord::Base
	validates :date, uniqueness: true
	
	belongs_to :residence, autosave: true
	
	has_many :inscriptions, dependent: :destroy
	has_many :users, :through => :inscriptions
	has_many :bids, dependent: :destroy
	has_many :users, :through => :bids
end
