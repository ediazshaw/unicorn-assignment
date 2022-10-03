class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :duration, :inclusion => 15..120 # validation to have duration between 15 and 120 minutes
end
