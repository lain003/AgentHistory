class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name,:unique=>true,:null => false

      t.timestamps
    end

    add_index :teams,:name
  end
end
