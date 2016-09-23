FactoryGirl.define do
  factory :reviewer do
    sequence(:name) {|n| "reviewer#{n}"}
    team { Reviewer.teams.keys.sample }
    compass_point { Reviewer.compass_points.keys.sample }
  end
end
