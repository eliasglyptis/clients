class AddFullNameAndOrganizationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :organization, :string
  end
end
