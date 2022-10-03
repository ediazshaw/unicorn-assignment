class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find(params[:id])
    @patient_id = params[:patient_id]
    render json: @doctor
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

  def busiest_doctors
    @doctors = Doctor.all
  end

  def over_six_hours
    @doctors = Doctor.all
  end
end

private

def doctor_params
  params.require(:doctor).permit(:name, :email)
end
