class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :subject
      t.string :qualifications
      t.integer :experience
      t.string :contact_information
      t.text :bio
      t.timestamps
    end
  end
end
