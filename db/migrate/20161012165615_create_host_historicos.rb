class CreateHostHistoricos < ActiveRecord::Migration[5.0]
  def change
    create_table :host_historicos do |t|
      t.integer :host_id
      t.boolean :nova_situacao
      t.boolean :novo_status
      t.integer :usuario_id
      t.string :motivo, limit: 1
      t.text :descricao
      t.integer :rede_id

      t.timestamps
    end
  end
end
