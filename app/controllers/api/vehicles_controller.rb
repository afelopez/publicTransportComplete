module Api
  class VehiclesController < ActionController::API
    include Response
    include ExceptionHandler

    def index
      @vehicles = Vehicle.all
    end

    def create
      @vehicle = Vehicle.create!(vehicle_params)
      json_response(@vehicle, :created)
    end

    private

    def vehicle_params
      params.permit(:plate, :color, :year)
    end
  end
end
