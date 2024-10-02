class MilkEntriesController < ApplicationController
  before_action :set_milk_entry, only: %i[ show edit update destroy ]

  # GET /milk_entries or /milk_entries.json
  def index
    @milk_entries = MilkEntry.all
  end

  # GET /milk_entries/1 or /milk_entries/1.json
  def show
  end

  # GET /milk_entries/new
  def new
    @milk_entry = MilkEntry.new
  end

  # GET /milk_entries/1/edit
  def edit
  end

  # POST /milk_entries or /milk_entries.json
  def create
    @milk_entry = MilkEntry.new(milk_entry_params)

    respond_to do |format|
      if @milk_entry.save
        format.html { redirect_to @milk_entry, notice: "Milk entry was successfully created." }
        format.json { render :show, status: :created, location: @milk_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milk_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milk_entries/1 or /milk_entries/1.json
  def update
    respond_to do |format|
      if @milk_entry.update(milk_entry_params)
        format.html { redirect_to @milk_entry, notice: "Milk entry was successfully updated." }
        format.json { render :show, status: :ok, location: @milk_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @milk_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milk_entries/1 or /milk_entries/1.json
  def destroy
    @milk_entry.destroy!

    respond_to do |format|
      format.html { redirect_to milk_entries_path, status: :see_other, notice: "Milk entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milk_entry
      @milk_entry = MilkEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def milk_entry_params
      params.require(:milk_entry).permit(:quantity, :date, :time, :farmer_id)
    end
end
