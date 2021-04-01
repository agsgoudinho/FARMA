class AddStepVersionToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :step_version, foreign_key: true
  end
end
