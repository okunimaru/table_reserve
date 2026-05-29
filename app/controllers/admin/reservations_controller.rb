class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order(date: :asc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation.update(status: params[:reservation][:status])
    redirect_to admin_reservation_path(@reservation), notice: "予約ステータスを更新しました"
  else
    render :show, status: :unprocessable_entity
  end
end
