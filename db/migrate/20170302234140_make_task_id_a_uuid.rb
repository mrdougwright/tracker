class MakeTaskIdAUuid < ActiveRecord::Migration
  def change
    add_column :tasks, :uuid, :uuid, default: "uuid_generate_v4()", null: false

    change_table :tasks do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE tasks ADD PRIMARY KEY (id);"
  end
end
