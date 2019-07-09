class CreateCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors do |t|
      t.string :first_name
      t.string :last_name
      # t.string :division
      t.string :gender
      t.integer :weight_in_lbs
      t.integer :height_in_inches
      t.integer :reach_in_inches
      # t.string :birthplace
      # t.datetime :birthdate
      t.integer :age
      t.integer :wins
      # t.integer :wins_by_ko 
      # t.integer :wins_by_sub
      # t.integer :wins_by_dec
      t.integer :losses
      # t.integer :loss_by_ko 
      # t.integer :loss_by_sub
      # t.integer :loss_by_dec
      # t.integer :draw_or_nc
    end
  end
end
