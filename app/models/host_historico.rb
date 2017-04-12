class HostHistorico < ApplicationRecord
	def self.search(query)
		where("id like ? ", "%#{query}%")
	end
	belongs_to :user


end
