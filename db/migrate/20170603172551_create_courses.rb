class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :length
      t.string :subjectstring
      t.integer :level
      t.string :image_url
      t.string :slug
     
      t.timestamps
    end
    add_index :courses, :slug, unique: true
  end
end
