class CreatedQueuedReviewers < ActiveRecord::Migration[5.0]
  def change
    create_table :queued_reviewers do |t|
      t.integer :reviewer_id
      t.timestamps
    end
  end
end
