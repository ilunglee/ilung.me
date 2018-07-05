class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :browser
      t.string :mobile
      t.string :video
      t.string :background_color
      t.integer :position
      t.text :devices, array: true, default: []

      t.timestamps
    end
  end
end
