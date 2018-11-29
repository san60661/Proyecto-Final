class Reserve < ActiveRecord::Base
	belongs_to :residence, autosave: true
	belongs_to :user, autosave: true
end
