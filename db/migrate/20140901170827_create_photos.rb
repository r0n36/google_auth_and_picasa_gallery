class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :picasa_id
      t.string :title
      t.string :photo_url

      t.timestamps
    end
  end
end
