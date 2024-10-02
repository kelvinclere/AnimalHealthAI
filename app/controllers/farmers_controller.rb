class FarmersController < ApplicationController
  before_action :set_farmer, only: %i[show edit update destroy]

  # GET /farmers or /farmers.json
  def index
    @farmers = Farmer.all.includes(:milk_entries, :cows) # Include associations for better performance
  end

  # GET /farmers/1 or /farmers/1.json
  def show
  end

  # GET /farmers/new
  def new
    @farmer = Farmer.new
    @farmer.milk_entries.build # Initialize at least one milk entry
    @farmer.cows.build          # Initialize at least one cow
  end

  # GET /farmers/1/edit
  def edit
    @farmer.milk_entries.build if @farmer.milk_entries.empty?
    @farmer.cows.build if @farmer.cows.empty?
  end

  # POST /farmers or /farmers.json
  def create
    @farmer = Farmer.new(farmer_params)

    respond_to do |format|
      if @farmer.save
        format.html { redirect_to @farmer, notice: "Farmer was successfully created." }
        format.json { render :show, status: :created, location: @farmer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmers/1 or /farmers/1.json
  def update
    respond_to do |format|
      if @farmer.update(farmer_params)
        format.html { redirect_to @farmer, notice: "Farmer was successfully updated." }
        format.json { render :show, status: :ok, location: @farmer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmers/1 or /farmers/1.json
  def destroy
    @farmer.destroy!

    respond_to do |format|
      format.html { redirect_to farmers_path, status: :see_other, notice: "Farmer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def farmer_params
    # Allow nested attributes for milk_entries and cows
    params.require(:farmer).permit(:name, milk_entries_attributes: [:id, :quantity, :date, :time, :_destroy], cows_attributes: [:id, :name, :age, :_destroy])
  end
end
