class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :universities, :slug, unique: true
  end
end
