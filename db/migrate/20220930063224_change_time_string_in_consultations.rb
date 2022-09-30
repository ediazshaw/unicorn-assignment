class ChangeTimeStringInConsultations < ActiveRecord::Migration[6.1]
  def change
    change_column :consultations, :starting_time, :time
  end
end
