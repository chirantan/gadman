class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.references :user, index: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
