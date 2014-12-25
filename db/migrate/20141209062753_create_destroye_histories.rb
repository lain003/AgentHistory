class CreateDestroyeHistories < ActiveRecord::Migration
  def change
    create_table :destroye_histories do |t|
      t.string :ident_code,:unique=>true,:null => false
      t.datetime :action_time,:null => false
      t.integer :agent_id,:null => false
      t.integer :portal_id,:null => false
      t.integer :resonator_level,:null => false

      t.timestamps
    end
    add_index :destroye_histories, :ident_code
    add_index :destroye_histories, :action_time
    add_index :destroye_histories, :agent_id
    add_index :destroye_histories, :portal_id
    add_index :destroye_histories, :resonator_level
  end
end
