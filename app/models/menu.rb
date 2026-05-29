class Menu < ApplicationRecord
  has_many :reservation_menus, dependent: :destroy
  has_many :reservations, through: :reservation_menus

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
