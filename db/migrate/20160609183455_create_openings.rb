class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.belongs_to :timeslot, index: true
      t.belongs_to :venue, index: true
      t.timestamps
    end
  end
end
