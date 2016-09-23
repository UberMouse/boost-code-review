class ReviewersController < ApplicationController
  before_action :load_reviewers, only: [:next, :next_single, :advance]
  after_action :generate_queues, only: [:advance, :advance_single]

  def index
    render json: Reviewer.all.to_json
  end

  def next
    render json: @reviewers.to_json
  end

  def next_single
    render json: @reviewers.select{|x| x.team == params[:team]}.first
  end

  def advance
    QueuedReviewer.where(reviewer_id: @reviewers.map(&:id)).delete_all
  end

  def advance_single
    QueuedReviewer.next(params[:team]).delete
  end

  private
  def load_reviewers
    @reviewers = Reviewer.teams.keys.map{|x| QueuedReviewer.next(x).reviewer}
  end

  def generate_queues
    Reviewer.teams.keys.each do |team|
      CreateNewReviewQueue.new.call(team) if QueuedReviewer.next(team).nil?
    end
  end
end
