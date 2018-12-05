class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable

	has_many :inscriptions
    has_many :auctions, :through => :inscriptions
    has_many :reserves, class_name: "Reserve"

    validates :cvv, length:  {minimum: 3, maximum: 3, too_long: "Debe ser de 3 digitos", too_short: "Debe ser de 3 digitos"}
    validates :card, length:  {minimum: 3, maximum: 3, too_long: "Debe ser de 16 digitos", too_short: "Debe ser de 16 digitos"}
end
