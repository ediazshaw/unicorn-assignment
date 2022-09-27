class ChangeClassToPatients < ActiveRecord::Migration[6.1]
  def change
    change_column :patients, :email, :string
  end
end
