class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @current_doctor_user = Doctor.find_by(user_id: current_user.id).class.to_s
    @current_patient_user = Patient.find_by(user_id: current_user.id).class.to_s
    # @doctor = Doctor.new
    @doctors = Doctor.all
    # @patient = Patient.new
    @patients = Patient.all
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    # # doctor_user = User.find_by(email:"#{@doctor.email}")
    # # @doctor.user_id = doctor_user.id
    # @doctor = Doctor.find_by(name: params[:doctor_id])
    # @consultation.doctor = Doctor.find_by(name: params[:doctor_id])
    # @consultation.patient = Patient.find_by(name: params[:patient_id])
    # @consultation.save
    # redirect_to doctor_path(@doctor)
  end
end

private

def consultation_params
  params.require(:consultation).permit(:doctor_id, :patient_id)
end
