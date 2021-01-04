class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :img_url
      t.integer :school_id

      t.timestamps
    end
  end
end
