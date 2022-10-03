class ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @doctors = Doctor.all
    @doctors_array = []
    @doctors.each { |doctor| @doctors_array << doctor.name }
    # Next line: if the user is a Patient, find its id for linking him to consultation
    @patient = Patient.find(params[:patient_id]) if Patient.find_by(email: current_user.email).class.to_s == "Patient"
    @consultation = Consultation.new
  end

  def create
    @patient = Patient.find(params[:patient_id]) if Patient.find_by(email: current_user.email).class.to_s == "Patient"
    @consultation = Consultation.new(consultation_params)
    @consultation.patient = @patient # link patient to consultation
    @consultation.doctor = Doctor.find_by(name: params["consultation"]["doctor_name"]) # link doctor to consultation
    @consultation.save
    redirect_to consultations_path
  end

  def cancelled
    @consultation = Consultation.find(params[:id])
    @consultation.cancelled = true # cancelling a consultation
    @consultation.save
  end
end

private

def consultation_params
  params.require(:consultation).permit(:date, :starting_time, :duration, :doctor_name)
end
