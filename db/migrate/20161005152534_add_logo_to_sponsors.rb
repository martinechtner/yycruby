class AddLogoToSponsors < ActiveRecord::Migration[5.0]
  def change
    add_attachment :sponsors, :logo
  end
end
