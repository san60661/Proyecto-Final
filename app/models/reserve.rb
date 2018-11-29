class Reserve < ActiveRecord::Base
	belongs_to :residence, optional: true
	belongs_to :user, optional: true
end
