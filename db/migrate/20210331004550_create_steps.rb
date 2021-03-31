class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :content
      t.text :correct_answer
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
