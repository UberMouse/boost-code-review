class CreateNewReviewQueue
  def call(team)
    reviewers = Reviewer.where(team: team).shuffle

    reviewers.each do |r|
      QueuedReviewer.create(reviewer_id: r.id)
    end
  end
end
