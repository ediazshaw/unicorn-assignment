class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :duration, :inclusion => 15..120
end
