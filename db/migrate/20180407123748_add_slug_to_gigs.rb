class AddSlugToGigs < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :slug, :string, unique: true
  end
end
