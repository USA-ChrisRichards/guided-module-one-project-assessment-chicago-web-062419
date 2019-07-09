class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      # t.string :title
      t.text :date  #	YYYY-MM-DD... TEXT
      t.string :city
      t.string :state
      t.string :venue
      t.integer :attendance
      t.integer :gate
    end
  end
end
