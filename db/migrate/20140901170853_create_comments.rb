class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :photo_id
      t.text :comment_body

      t.timestamps
    end
  end
end
