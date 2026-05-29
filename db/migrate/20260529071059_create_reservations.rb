class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :floor, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.integer :number_of_people
      t.string :status

      t.timestamps
    end
  end
end
