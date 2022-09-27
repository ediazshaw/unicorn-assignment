class AddEmailToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :email, :string
  end
end
