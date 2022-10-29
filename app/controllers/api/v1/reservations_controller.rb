class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created, data: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: { data: @reservation, mesage: 'Updated Reservation Successfully', status: :ok }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { data: 'Deleted Reservation Successfully', status: :ok }
    else
      render json: { data: 'Successfully went wrong', status: 'failed' }
    end
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :city, :teacher_id)
  end
end
