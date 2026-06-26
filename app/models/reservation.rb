class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :floor
  has_many :reservation_menus, dependent: :destroy
  has_many :menus, through: :reservation_menus
  accepts_nested_attributes_for :reservation_menus

  validates :date, presence: true
  validates :time, presence: true
  validates :number_of_people, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending approved rejected] }
end
