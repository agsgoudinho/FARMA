class AddStepToTips < ActiveRecord::Migration[5.1]
  def change
    add_reference :tips, :step, foreign_key: true
  end
end
