class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, authorId: :primary_key do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :postCounter

      t.timestamps
    end
  end
end
