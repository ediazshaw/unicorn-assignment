class PatientsController < ApplicationController

  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    patient_user = User.find_by(email:"#{@patient.email}")
    @patient.user_id = patient_user.id
    @patient.save
    redirect_to patient_path(@patient)
  end
end

private

def patient_params
  params.require(:patient).permit(:name, :email)
end
