class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :gadget, index: true
      t.string :gadget_photo

      t.timestamps
    end
  end
end
