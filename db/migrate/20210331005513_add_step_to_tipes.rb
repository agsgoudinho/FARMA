class AddStepToTipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :tipes, :step, foreign_key: true
  end
end
