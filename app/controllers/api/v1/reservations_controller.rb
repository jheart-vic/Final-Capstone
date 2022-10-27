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
    # @reservation = Reservation.new(reservation_params)
    @reservation = current_user.reservations.new(reservation_params)

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

  # def set_reservation
  #   @reservation = current_user.reservations.find(params[:id])
  #  rescue ActiveRecord::RecordNotFound => e
  #   render json: e.message, status: :unauthorized
  # end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :city)
  end
end
