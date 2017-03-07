json.extract! rede, :id, :nome, :descricao, :ativa, :controle_mac, :controle_usuario, :grupo_ad, :created_at, :updated_at
json.url rede_url(rede, format: :json)