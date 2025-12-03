class Api::V1::PackageDestinationsController < ApplicationController
  before_action :set_package_destination, only: %i[ show update destroy ]

  # GET /package_destinations
  def index
    @package_destinations = PackageDestination.all

    render json: @package_destinations
  end

  # GET /package_destinations/1
  def show
    render json: @package_destination
  end

  # POST /package_destinations
  def create
    @package_destination = PackageDestination.new(package_destination_params)

    if @package_destination.save
      render json: @package_destination, status: :created, location: @package_destination
    else
      render json: @package_destination.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /package_destinations/1
  def update
    if @package_destination.update(package_destination_params)
      render json: @package_destination
    else
      render json: @package_destination.errors, status: :unprocessable_content
    end
  end

  # DELETE /package_destinations/1
  def destroy
    @package_destination.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_destination
      @package_destination = PackageDestination.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def package_destination_params
      params.expect(package_destination: [ :package_id, :destination_id ])
    end
end
