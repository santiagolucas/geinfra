class AddControlePorToRedes < ActiveRecord::Migration[5.0]
  def change
    add_column :redes, :controle_por, :string
  end
end
