class User < ApplicationRecord
	has_secure_password
	has_many :host_historicos

	def self.search(query)
		where("nome like ? ", "%#{query}%")
	end
	validates :nome, :login,  presence: true
	validates :password, length: { in: 4..20}
	validates :situacao, length: {is: 1}
end
