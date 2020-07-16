class CreateUrls < ActiveRecord::Migration[6.0]

  def change

    drop_table :urls

    create_table :urls do |t|
      t.string :name
      t.text :long_url
      t.string :short_url
      t.integer :click, default: 0
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
