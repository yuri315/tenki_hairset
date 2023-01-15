class CreateHairsFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :hairs_features do |t|
      t.string :hair_type

      t.timestamps
    end
  end
end
