class StepsVersion < ApplicationRecord
  belongs_to :step
  belongs_to :exercise_version
end
