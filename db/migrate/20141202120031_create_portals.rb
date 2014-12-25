class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.integer :latE6,:null => false
      t.integer :lngE6,:null => false
      t.string :address,:null => false
      t.string :name,:null => false

      t.timestamps
    end

    add_index :portals, [:latE6, :lngE6], :unique => true, :name => 'e6_index'
  end
end
