class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.integer :event_id
      t.integer :competitor_id
    end
  end
end
