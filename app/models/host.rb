class Host < ApplicationRecord
	# before_save :salva_historico
	

	# attr_accessor :usuario_alteracao

	def self.search(query)
		where("mac like ? ", "%#{query}%")
	end
	validates :mac, :nome, presence: true
	belongs_to :rede


=begin
private
	def salva_historico
		#return false if self.usuario_alteracao.nil? or self.usuario_alteracao.blank?
		historico = HostHistorico.new
		#historico.nome = self.nome_was
		#<HostHistorico id: nil, host_id: nil, nova_situacao: nil, novo_status: nil, usuario_id: nil, motivo: nil, descricao: nil, rede_id: nil, created_at: nil, updated_at: nil, user_id: nil>
		historico.host_id = self.id_was
		historico.rede_id = self.rede_id_was
		historico.user_id = self.usuario_alteracao
		historico.motivo = "A"
		historico.save!

	end
=end	
end
