class Api::V1::ReservationsController < ApplicationController
  def index
    # @reservations = Reservation.all
    @reservations = current_user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @teachers = 

    if @reservation.save
      render json: @reservation, status: :created, data: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :city)
  end
end
