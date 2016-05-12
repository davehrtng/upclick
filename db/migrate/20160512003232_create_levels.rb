class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :number_of_clicks
      t.string :image_name

      t.timestamps null: false
    end
  end
end
