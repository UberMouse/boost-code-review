class CreateReviewer < ActiveRecord::Migration[5.0]
  def change
    create_table :reviewers do |t|
      t.text :name
      t.integer :compass_point
      t.integer :team
      t.timestamps
    end
  end
end
