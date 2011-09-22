class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :slug

      t.timestamps
    end
  end
end
