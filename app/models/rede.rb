class Rede < ApplicationRecord
	def self.search(query)
		where("nome like ? ", "%#{query}%")
	end
	validates :nome, :grupo_ad, presence: true
end
