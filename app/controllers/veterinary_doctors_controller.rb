class VeterinaryDoctorsController < ApplicationController
  before_action :set_veterinary_doctor, only: %i[show edit update destroy]

  def index
    @veterinary_doctors = VeterinaryDoctor.all
  end

  def show
  end

  def new
    @veterinary_doctor = VeterinaryDoctor.new
  end

  def edit
  @veterinary_doctor = VeterinaryDoctor.find(params[:id])
end


  def create
    @veterinary_doctor = VeterinaryDoctor.new(veterinary_doctor_params)
    if @veterinary_doctor.save
      redirect_to @veterinary_doctor, notice: 'Veterinary doctor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @veterinary_doctor.update(veterinary_doctor_params)
      redirect_to @veterinary_doctor, notice: 'Veterinary doctor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @veterinary_doctor.destroy
    redirect_to veterinary_doctors_url, notice: 'Veterinary doctor was successfully destroyed.'
  end

  private

  def set_veterinary_doctor
    @veterinary_doctor = VeterinaryDoctor.find(params[:id])
  end

  def veterinary_doctor_params
    params.require(:veterinary_doctor).permit(:name, :about, :contact_details, :location)
  end
end
