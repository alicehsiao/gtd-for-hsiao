class ChangeStatusToStringSetDefault < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :status
    add_column :tasks, :status, :string, default: 'Mark Complete'
  end
end
