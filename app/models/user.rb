class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable

	has_many :inscriptions
    has_many :auctions, :through => :inscriptions
    has_many :reserves, class_name: "Reserve"

    validates :cvv, length:  {minimum: 3, maximum: 3, too_long: "Debe ser de 3 digitos", too_short: "Debe ser de 3 digitos"}
    validates :card, length:  {minimum: 16, maximum: 16, too_long: "Debe ser de 16 digitos", too_short: "Debe ser de 16 digitos"}
    validate :mayor_de_18
    def mayor_de_18 
    	now = Time.now.utc.to_date 
    	age = now.year - birth.year - ((now.month > birth.month || (now.month == birth.month && now.day >= birth.day)) ? 0 : 1) 
		if age<18
			errors.add(:birth, "Debe ser mayor de 18 años")
		end
	end 
	validate :vencida
	def vencida
		now = Time.now.utc.to_date
		#e=expiration.to_date
		e=expiration[0..3]
		if (now.year == e)
			if (now.month < e.month)
				errors.add(:expiration, "La tarjeta esta vencida")
			end
		else
			if (now.year > e.year)
				errors.add(:expiration, "La tarjeta esta vencida")
			end
		end

	end
end
	