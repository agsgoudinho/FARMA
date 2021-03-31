class CreateLosVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :los_versions do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.references :lo, foreign_key: true

      t.timestamps
    end
  end
end
