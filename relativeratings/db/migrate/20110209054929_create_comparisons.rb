class CreateComparisons < ActiveRecord::Migration
  def self.up
    create_table :comparisons do |t|
      t.integer :times
      t.belongs_to :place
      t.string :compared_to
      t.timestamps
    end
  end

  def self.down
    drop_table :comparisons
  end
end
