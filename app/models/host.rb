class Host < ApplicationRecord
	before_save :salva_historico
	audited
	attr_accessor :usuario_alteracao

	def self.search(query)
		where("mac like ? ", "%#{query}%")
	end
	validates :mac, :nome, presence: true
	belongs_to :rede


private
	def salva_historico
		#return false if self.usuario_alteracao.nil? or self.usuario_alteracao.blank?
		historico = HostHistorico.new
		#historico.nome = self.nome_was
		#<HostHistorico id: nil, host_id: nil, nova_situacao: nil, novo_status: nil, usuario_id: nil, motivo: nil, descricao: nil, rede_id: nil, created_at: nil, updated_at: nil, user_id: nil>
		historico.user_id = self.usuario_alteracao
		historico.novo_mac = self.mac
		historico.old_mac = self.mac_was
		historico.nova_validade = self.validade
		historico.old_validade = self.validade_was
		
		
		
		historico.nova_rede = self.rede.id
		historico.old_rede = self.rede.id_was
		
		
		
		historico.old_nome = self.nome_was
		historico.novo_ativo = self.ativo_was
		historico.nome = self.nome
		historico.save!

	end

end
