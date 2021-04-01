class CreateExercisesVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises_versions do |t|
      t.string :title
      t.text :content
      t.references :exercise, foreign_key: true
      t.references :lo_version, foreign_key: true

      t.timestamps
    end
  end
end
