class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @doctors = Doctor.all
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    doctor_user = User.find_by(email:"#{@doctor.email}")
    @doctor.user_id = doctor_user.id
    @doctor.save
    redirect_to doctor_path(@doctor)
  end
end

private

def consultation_params
  params.require(:doctor).permit(:name, :email)
end
