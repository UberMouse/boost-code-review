class QueuedReviewer < ApplicationRecord
  belongs_to :reviewer

  def team
    reviewer.team
  end

  def self.next(team)
    QueuedReviewer.all.select{|x| x.team == team}.first
  end
end
