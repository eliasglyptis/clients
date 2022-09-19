class AddCategoryRefToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :category, null: false, foreign_key: true
  end
end
