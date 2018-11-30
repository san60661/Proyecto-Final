class Residence < ActiveRecord::Base
	has_many :auctions
	has_many :reserves, class_name: "Reserve"
end
