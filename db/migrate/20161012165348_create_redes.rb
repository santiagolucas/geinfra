class CreateRedes < ActiveRecord::Migration[5.0]
  def change
    create_table :redes do |t|
      t.string :nome
      t.text :descricao
      t.boolean :ativa
      t.boolean :controle_mac
      t.boolean :controle_usuario
      t.string :grupo_ad

      t.timestamps
    end
  end
end
