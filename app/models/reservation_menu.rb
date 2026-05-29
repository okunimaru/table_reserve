class ReservationMenu < ApplicationRecord
  belongs_to :reservation
  belongs_to :menu

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
