class Host < ApplicationRecord
	def self.search(query)
		where("mac like ? ", "%#{query}%")
	end
	validates :mac, :nome, presence: true
	
end
