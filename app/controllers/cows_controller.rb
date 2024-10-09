class CowsController < ApplicationController
  before_action :set_cow, only: %i[show edit update destroy]

  # GET /cows
  def index
    @cows = Cow.all
  end

  # GET /cows/new
  def new
    @cow = Cow.new
  end

  # GET /cows/:id/edit
  def edit
  end

  # POST /cows
  def create
    @cow = Cow.new(cow_params)

    if @cow.save
      redirect_to @cow, notice: 'Cow was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cows/:id
  def update
    if @cow.update(cow_params)
      redirect_to @cow, notice: 'Cow was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cows/:id
  def destroy
    @cow.destroy
    redirect_to cows_url, notice: 'Cow was successfully deleted.'
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
