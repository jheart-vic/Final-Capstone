class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
<<<<<<< HEAD
    @reservation = Reservation.new(reservation_params)
    @teachers = 

=======
    @reservation = current_user.reservations.new(reservation_params) 
>>>>>>> 04e281dae1d21ea2891c50eba6dbc8d634b585b9
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
    params.require(:reservation).permit(:reservation_date, :city, :teacher_id)
  end
end
