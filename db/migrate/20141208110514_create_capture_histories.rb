class CreateCaptureHistories < ActiveRecord::Migration
  def change
    create_table :capture_histories do |t|
      t.string :ident_code,:unique=>true,:null => false
      t.datetime :action_time,:null => false
      t.integer :agent_id,:null => false
      t.integer :portal_id,:null => false

      t.timestamps
    end
    add_index :capture_histories, :ident_code
    add_index :capture_histories, :action_time
    add_index :capture_histories, :agent_id
    add_index :capture_histories, :portal_id
  end
end
