class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show]

  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  def create
    @passenger = Passenger.new(passenger_params)

    respond_to do |format|
      if @passenger.save
        format.html { redirect_to @passenger, notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to @passenger, notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:name, :email)
    end
end
