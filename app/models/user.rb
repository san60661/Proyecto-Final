class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable

	has_many :inscriptions
    has_many :auctions, :through => :inscriptions
    has_many :reserves, class_name: "Reserve"
    has_many :bids	
	has_many :auctions, :through => :bids

  
	validates :credits, inclusion: { in: 0..2 }

	validate :mayor_de_18
    def mayor_de_18 
    	now = Time.now.utc.to_date 
    	age = now.year - birth.year - ((now.month > birth.month || (now.month == birth.month && now.day >= birth.day)) ? 0 : 1) 
		if age<18
			errors.add(:base, "Debe ser mayor de 18 años")
		end
	end
	validate :cvv2
	def cvv2
		if cvv.digits.length != 3
			errors.add(:base, "El cvv debe tener 3 digitos")
		end
	end

	validate :tarjeta

	def tarjeta
	if card.mb_chars.length !=16
		errors.add(:base, 'El numero de la tarjeta debe tener 16 digitos')
	end
	end
	
	validate :vencida
	def vencida
		now = Time.now.utc.to_date
		#e=expiration.to_date
		y=expiration[0..3].to_i
		m=expiration[5..6].to_i
		ny=now.year.to_i
		nm=now.month.to_i
		if (ny == y)
			if (nm > m)
				errors.add(:base, "La tarjeta esta vencida")
			end
		else
			if (ny > y)
				errors.add(:base, "La tarjeta esta vencida")
			end
		end
	end

end
