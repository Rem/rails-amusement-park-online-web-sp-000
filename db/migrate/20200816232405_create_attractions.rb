class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :height_requirement
      t.integer :fun
      t.integer :nausea
      t.integer :tickets
    end
  end
end
