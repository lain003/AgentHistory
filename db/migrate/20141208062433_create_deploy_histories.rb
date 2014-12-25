class CreateDeployHistories < ActiveRecord::Migration
  def change
    create_table :deploy_histories do |t|
      t.string :ident_code,:unique=>true,:null => false
      t.datetime :action_time,:null => false
      t.integer :agent_id,:null => false
      t.integer :portal_id,:null => false
      t.integer :resonator_level,:null => false

      t.timestamps
    end

    add_index :deploy_histories,:agent_id
    add_index :deploy_histories,:portal_id
    add_index :deploy_histories,:resonator_level
    add_index :deploy_histories,:action_time
    add_index :deploy_histories,:ident_code
  end
end
