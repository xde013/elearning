class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
       t.references :university, foreign_key: true
    end
  end
end
