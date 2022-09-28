class ChangeTimeInConsultations < ActiveRecord::Migration[6.1]
  def change
    change_column :consultations, :starting_time, :integer
  end
end
