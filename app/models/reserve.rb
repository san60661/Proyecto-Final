class Reserve < ApplicationRecord
	belongs_to :residence
	belongs_to :user
end
