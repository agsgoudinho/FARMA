class AddStepVersionToTipsCounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :tips_counts, :steps_version, foreign_key: true
  end
end
