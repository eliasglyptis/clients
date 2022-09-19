class AddActiveAndRevenueToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :active, :boolean, default: true
    add_column :clients, :revenue, :decimal, precision: 8, scale: 2
  end
end
