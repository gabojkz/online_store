class CreateBaskets < ActiveRecord::Migration[5.0]
  def change
    create_table :baskets do |t|
      t.references :product, foreign_key: true
      t.references :client, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
