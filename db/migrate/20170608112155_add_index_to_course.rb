class AddIndexToCourse < ActiveRecord::Migration[5.1]
  def change
     change_table :courses do |t|
       t.references :user, foreign_key: true
    end
  end
end
