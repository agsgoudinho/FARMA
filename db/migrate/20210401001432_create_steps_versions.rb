class CreateStepsVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :steps_versions do |t|
      t.string :title
      t.text :content
      t.text :correct_answer
      t.references :step, foreign_key: true
      t.references :exercise_version, foreign_key: true

      t.timestamps
    end
  end
end
