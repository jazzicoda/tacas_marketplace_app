class CreateListingsColours < ActiveRecord::Migration[6.1]
  def change
    create_table :listings_colours do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :colour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
