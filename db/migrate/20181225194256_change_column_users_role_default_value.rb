class ChangeColumnUsersRoleDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :string, :default => "1"
  end
end
