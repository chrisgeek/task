class AddDoneToGigs < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :done, :boolean, null: false, default: 'false'
  end
end
