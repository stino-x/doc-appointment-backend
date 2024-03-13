class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :subject
      t.string :image
      t.string :qualifications
      t.integer :experience
      t.string :contact_information
      t.text :bio
      t.boolean  :active, default: true
      t.references :admin_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
