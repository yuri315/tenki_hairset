class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :city_name, null: false,  comment: "都市名"
      t.float "lat", null: false, comment: "locationの緯度"
      t.float "lon", null: false, comment: "locationの経度"

      t.timestamps
    end
  end
end
