RSpec.describe CreateNewReviewQueue do
  let(:team) {Reviewer.teams.keys.first}
  let(:other_team) {Reviewer.teams.keys.last}
  let(:compass_points) {Reviewer.compass_points.keys}

  before do
    compass_points.each do |point|
      create(:reviewer, team: team, compass_point: point)
    end
    create(:reviewer, team: other_team)
  end

  describe 'generating a new queue for a specific team' do
    before do
      subject.call(team)
    end

    it 'creates a new queued reviewer for each reviewer on the team' do
      expect(QueuedReviewer.count).to eq(4)
    end

    it 'makes them all for the given team' do
      expect(QueuedReviewer.all.map(&:team)).to all(eq(team))
    end
  end
end
