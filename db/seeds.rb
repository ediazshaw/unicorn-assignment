# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user1 = User.new()
p "Destroying previous seeds"
Consultation.destroy_all
Admin.destroy_all
Doctor.destroy_all
Patient.destroy_all
User.destroy_all
p "Creating seeds"
(1..10).to_a.each do |n|
  user_doctor = User.create(email: "doctor#{n}@doctor#{n}.com", password: "123456", password_confirmation: "123456")
  doctor = Doctor.create(email: "doctor#{n}@doctor#{n}.com", name: "doctor#{n}", user_id: user_doctor.id)
  user_patient = User.create(email: "patient#{n}@patient#{n}.com", password: "123456", password_confirmation: "123456")
  patient = Patient.create(email: "patient#{n}@patient#{n}.com", name: "patient#{n}", user_id: user_patient.id)
  user_admin = User.create(email: "admin#{n}@admin#{n}.com", password: "123456", password_confirmation: "123456")
  Admin.create(email: "admin#{n}@admin#{n}.com", name: "admin#{n}", user_id: user_admin.id)
  Consultation.create(doctor_id: doctor.id, patient_id: patient.id, date: Date.today, doctor_name: doctor.name, starting_time: Time.new(2022, 02, 24, rand(9..17), [00,15,30,45].sample, 0, "+00:00"), duration: [15,30,45,60,75,90,105,120].sample)
end
p "Done"
