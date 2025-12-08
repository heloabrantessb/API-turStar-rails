class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show update destroy ]

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_content
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.expect(reservation: [ :reservation_date, :status, :user_id, :package_id ])
    end
end
