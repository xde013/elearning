class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :teacher_role, :boolean
    add_column :users, :student_role, :boolean
  end
end
