class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :description
      t.datetime :timeline
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
