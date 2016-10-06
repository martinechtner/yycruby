class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.text :description
      t.string :company_career_url
      t.string :posting_url
      t.string :title
      t.attachment :logo

      t.timestamps
    end
  end
end
