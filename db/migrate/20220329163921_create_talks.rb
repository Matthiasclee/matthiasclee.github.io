class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.string :name
      t.string :location
      t.string :website
      t.string :download
      t.date :date

      t.timestamps
    end
  end
end
