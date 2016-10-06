class AddPositionToSponsors < ActiveRecord::Migration[5.0]
  def change
    add_column :sponsors, :position, :integer
  end
end
