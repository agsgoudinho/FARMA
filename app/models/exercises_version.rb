class ExercisesVersion < ApplicationRecord
  belongs_to :exercise
  belongs_to :lo_version
end
