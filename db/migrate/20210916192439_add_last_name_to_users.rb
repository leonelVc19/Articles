class AddLastNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :paternal_surname, :string
    add_column :users, :maternal_surname, :string
  end
end
