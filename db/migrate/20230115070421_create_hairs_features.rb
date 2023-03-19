class CreateHairsFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :hairs_features do |t|
      t.string :hair_type
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
