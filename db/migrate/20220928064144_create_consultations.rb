class CreateConsultations < ActiveRecord::Migration[6.1]
  def change
    create_table :consultations do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.boolean :cancelled, default: false
      t.date :date
      t.time :starting_time
      t.integer :duration

      t.timestamps
    end
  end
end
