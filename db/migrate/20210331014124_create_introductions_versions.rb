class CreateIntroductionsVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :introductions_versions do |t|
      t.string :title
      t.text :content
      t.references :introduction, foreign_key: true
      t.references :los_version, foreign_key: true

      t.timestamps
    end
  end
end
