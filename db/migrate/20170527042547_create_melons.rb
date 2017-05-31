class CreateMelons < ActiveRecord::Migration
  def change
    create_table :melons do |t|
      t.integer :post_id
      t.string :name
      t.string :artist
      t.string :album
      t.timestamps null: false
    end
  end
end
