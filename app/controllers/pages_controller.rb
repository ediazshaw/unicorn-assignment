class PagesController < ApplicationController
  def about
  end

  def type
    @current_doctor_user = Doctor.find_by(user_id: current_user.id).class.to_s
    @current_patient_user = Patient.find_by(user_id: current_user.id).class.to_s
    @current_admin_user = Admin.find_by(user_id: current_user.id).class.to_s
    @current_doctor_id = Doctor.find_by(user_id: current_user.id).id if @current_doctor_user == "Doctor"
    @current_patient_id = Patient.find_by(user_id: current_user.id).id if @current_patient_user == "Patient"
    @current_admin_id = Admin.find_by(user_id: current_user.id).id if @current_admin_user == "Admin"
  end
end
