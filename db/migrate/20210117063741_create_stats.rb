class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :clicks,:default => 0
      t.string :country, array:true, default: []
      t.references :url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
