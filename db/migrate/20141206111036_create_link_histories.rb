class CreateLinkHistories < ActiveRecord::Migration
  def change
    create_table :link_histories do |t|
      t.string :ident_code,:unique=>true,:null => false
      t.datetime :action_time,:null => false
      t.integer :agent_id,:null => false
      t.integer :to_portal_id,:null => false
      t.integer :from_portal_id,:null => false

      t.timestamps
    end

    add_index :link_histories,:agent_id
    add_index :link_histories,:to_portal_id
    add_index :link_histories,:from_portal_id
    add_index :link_histories,:action_time
    add_index :link_histories,:ident_code
  end
end
