class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :mac
      t.string :nome
      t.text :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
