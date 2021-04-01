class TipsVersion < ApplicationRecord
  belongs_to :tip
  belongs_to :step_version
end
