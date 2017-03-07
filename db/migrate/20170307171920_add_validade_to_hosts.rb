class AddValidadeToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :validade, :datetime
  end
end
