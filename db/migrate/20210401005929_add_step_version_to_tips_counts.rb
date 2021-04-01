class AddStepVersionToTipsCounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :tips_counts, :step_version, foreign_key: true
  end
end
