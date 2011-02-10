class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :location
      t.text :description
      t.string :title
      t.integer :rating
      t.belongs_to :comparison
 
      t.integer :absolute_rank

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
