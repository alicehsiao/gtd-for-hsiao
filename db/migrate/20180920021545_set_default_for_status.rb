class SetDefaultForStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :status
    add_column :tasks, :status, :boolean, default: false
  end
end
