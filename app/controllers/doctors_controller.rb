class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    @patient_id = params[:patient_id]
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    doctor_user = User.find_by(email:"#{@doctor.email}")
    @doctor.user_id = doctor_user.id
    @doctor.save
    redirect_to doctor_path(@doctor)
  end

  def slots
    @hour = 9
  end
end

private

def doctor_params
  params.require(:doctor).permit(:name, :email)
end
