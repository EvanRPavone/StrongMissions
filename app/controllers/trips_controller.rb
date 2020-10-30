class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    if params[:group_name]
      @trips = Trip.search(params[:group_name])
    else
      @trips = Trip.all
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    # @trip = Trip.new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    # @trip = Trip.new(trip_params)
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to trips_path, notice: 'Trip was successfully created.'
    else
      redirect_to new_trip_path, notice: 'Cannot leave information blank.'
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
      if @trip.update(trip_params)
        redirect_to trips_path, notice: 'Trip was successfully updated.'
      else
        redirect_to edit_trip_path, notice: 'Cannot leave information blank.'
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    redirect_to trips_path, notice: 'Trip was successfully removed.'
  end

  def correct_user #finds the trip_id that is associated to the current_user id. if the user does not own that trip then it will redirect them to the trip index page with a notice.
    @trip = current_user.trips.find_by(id: params[:id])
    redirect_to trips_path, notice: 'not authorized to edit this trip' if @trip.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:group_name, :email, :when, :jobs, :escursions, :additional_info, :user_id)
    end
end
