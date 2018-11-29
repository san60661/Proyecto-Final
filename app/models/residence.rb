class Residence < ActiveRecord::Base
	has_many :reserves, class_name: "Reserve"
end
