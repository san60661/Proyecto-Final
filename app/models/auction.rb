class Auction < ApplicationRecord
	belongs_to :residence, autosave: true
	belongs_to :user, autosave: true, optional: true
end
