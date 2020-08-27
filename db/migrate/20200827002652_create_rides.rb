class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :User, foreign_key: true
      t.belongs_to :Attraction, foreign_key: true
    end
  end
end
