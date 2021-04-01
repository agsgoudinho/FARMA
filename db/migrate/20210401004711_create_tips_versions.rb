class CreateTipsVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :tips_versions do |t|
      t.string :content
      t.integer :number_of_tries
      t.references :tip, foreign_key: true
      t.references :steps_version, foreign_key: true

      t.timestamps
    end
  end
end
