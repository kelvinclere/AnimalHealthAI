class CowsController < ApplicationController
  before_action :set_cow, only: %i[ show edit update destroy ]

  # GET /cows or /cows.json
  def index
    @cows = Cow.all
  end

  # GET /cows/1 or /cows/1.json
  def show
  end

  # GET /cows/new
  def new
    @cow = Cow.new
  end

  # GET /cows/1/edit
  def edit
  end

  # POST /cows or /cows.json
  def create
    @cow = Cow.new(cow_params)

    respond_to do |format|
      if @cow.save
        format.html { redirect_to @cow, notice: "Cow was successfully created." }
        format.json { render :show, status: :created, location: @cow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cows/1 or /cows/1.json
  def update
    respond_to do |format|
      if @cow.update(cow_params)
        format.html { redirect_to @cow, notice: "Cow was successfully updated." }
        format.json { render :show, status: :ok, location: @cow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cows/1 or /cows/1.json
  def destroy
    @cow.destroy!

    respond_to do |format|
      format.html { redirect_to cows_path, status: :see_other, notice: "Cow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cow
      @cow = Cow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cow_params
      params.require(:cow).permit(:name, :age, :farmer_id)
    end
end
