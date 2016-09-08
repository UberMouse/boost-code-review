class CreateNewReviewQueue
  def call
    reviewers = Reviewer.all.shuffle

    reviewers.each do |r|
      QueuedReviewer.create(reviewer_id: r.id)
    end
  end
end
