class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.st_point :lonlat, geography: true
      t.string :name
      t.string :address
      t.string :google_place_id

      t.timestamps
    end

    add_index :stores, :lonlat, using: :gist
  end
end
