json.extract! host, :id, :mac, :nome, :descricao, :ativo, :created_at, :updated_at
json.url host_url(host, format: :json)