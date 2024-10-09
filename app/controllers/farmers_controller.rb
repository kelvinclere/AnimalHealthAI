class FarmersController < ApplicationController
  before_action :set_farmer, only: %i[ show edit update destroy ]

  # GET /farmers or /farmers.json
  def index
    @farmers = Farmer.all
  end

  # GET /farmers/1 or /farmers/1.json
 def show
  @farmer = Farmer.includes(:cows, :milk_entries).find(params[:id])
end

  # GET /farmers/new
  def new
    @farmer = Farmer.new
    @farmer.milk_entries.build  # Initialize milk entries
    @farmer.cows.build          # Initialize cows
  end

  # GET /farmers/1/edit
  def edit
    @farmer.milk_entries.build if @farmer.milk_entries.empty?
    @farmer.cows.build if @farmer.cows.empty?
  end

  # POST /farmers or /farmers.json
  def create
    @farmer = Farmer.new(farmer_params)
    if @farmer.save
      redirect_to @farmer, notice: "Farmer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /farmers/1 or /farmers/1.json
  def update
    if @farmer.update(farmer_params)
      redirect_to @farmer, notice: "Farmer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /farmers/1 or /farmers/1.json
  def destroy
    @farmer.destroy
    redirect_to farmers_url, notice: "Farmer was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def farmer_params
    params.require(:farmer).permit(:name, 
      milk_entries_attributes: [:id, :quantity, :date, :time, :_destroy], 
      cows_attributes: [:id, :name, :age, :_destroy])
  end
end
