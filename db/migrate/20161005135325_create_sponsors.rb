class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :company
      t.text :description
      t.string :url
      t.text :sponsoring

      t.timestamps
    end
  end
end
