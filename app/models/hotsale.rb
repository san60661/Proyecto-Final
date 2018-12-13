class Hotsale < ApplicationRecord
	belongs_to :residence, autosave: true
	validates :date, uniqueness: true
end
