class Reviewer < ApplicationRecord
  validates :name, presence: true
  validates :team, presence: true
  validates :compass_point, presence: true

  enum compass_point: %w(north east south west)
  enum team: %w(dnz natlib)
end
