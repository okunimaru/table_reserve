class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user: current_user).order(date: :asc)
  end

  def new
    @reservation = Reservation.new
    @floors = Floor.all
    @menus = Menu.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.status = "pending"

    if @reservation.save
      redirect_to @reservation, notice: "予約を受け付けました"
    else
      @floors = Floor.all
      @menus = Menu.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:floor_id, :date, :time, :number_of_people, menu_ids: [], reservation_menus_attributes: [:menu_id, :quantity])
  end
end
