class Host < ApplicationRecord
	def self.search(query)
		where("mac like ? ", "%#{query}%")
	end
	validates :mac, :nome, presence: true
	belongs_to :rede
	
end
