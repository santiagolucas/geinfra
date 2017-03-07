class HostHistorico < ApplicationRecord
	def self.search(query)
		where("id like ? ", "%#{query}%")
	end
	belongs_to :host
	belongs_to :user
	belongs_to :rede
	validates :motivo, length: { is: 1}


	def nova_situacao_str
		((self.nova_situacao)?"ativo":"inativo")
	end

	def novo_status_str
		((self.novo_status)?"ativo":"inativo")
	end
end
