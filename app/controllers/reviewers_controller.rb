class ReviewersController < ApplicationController
  before_action :load_reviewers, only: [:next, :advance]

  def index
    render json: Reviewer.all.to_json
  end

  def next
    render json: @reviewers.to_json
  end

  def advance
    QueuedReviewer.where(reviewer_id: @reviewers.map(&:id)).delete_all

    CreateNewReviewQueue.new.call if QueuedReviewer.count == 0
  end

  private
  def load_reviewers
    @reviewers = ['dnz', 'natlib'].map{|x| QueuedReviewer.next(x).reviewer}
  end
end
