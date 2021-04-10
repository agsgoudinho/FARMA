class CreateTriggerWlastAnswers < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TRIGGER wlast_answers
        BEFORE INSERT
        ON answers
        FOR EACH ROW
	      EXECUTE PROCEDURE wlast_answers();
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER wlast_answers ON answers;
    SQL
  end
end
