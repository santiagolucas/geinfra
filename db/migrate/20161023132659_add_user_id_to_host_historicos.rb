class AddUserIdToHostHistoricos < ActiveRecord::Migration[5.0]
  def change
    add_column :host_historicos, :user_id, :integer
  end
end
