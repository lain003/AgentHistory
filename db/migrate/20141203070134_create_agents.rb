class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name,:unique=>true,:null => false
      t.integer :team_id,:null => false

      t.timestamps
    end

    add_index :agents, :name
    add_index :agents, :team_id
  end
end
