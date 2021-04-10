class FunctionWlastAnswers < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION wlast_answers()
      RETURNS trigger AS
      $BODY$
        DECLARE
          array_answers INTEGER[];
          array_versions_steps INTEGER[];
          current_lo INTEGER;
        BEGIN
          -- pega o lo associado a resposta
          SELECT e.lo_version_id INTO current_lo
          FROM steps_versions as s, exercises_versions as e
          WHERE NEW.step_version_id = s.id
          AND s.exercise_version_id = e.id;

          array_versions_steps = array(
            SELECT DISTINCT ON (s.step_id) s.id
            FROM steps_versions as s, exercises_versions as e
            WHERE s.exercise_version_id = e.id
            AND e.lo_version_id = current_lo
            ORDER BY s.step_id, s.id DESC
          );

          array_answers = array( SELECT id FROM answers
          WHERE step_version_id = ANY(array_versions_steps));

          NEW.last_answers = array_answers;
          RETURN NEW;
        END;
      $BODY$
      LANGUAGE plpgsql VOLATILE
      COST 100;
        ALTER FUNCTION wlast_answers()
      OWNER TO postgres;
    SQL
  end

  def down
    execute <<-SQL
      DROP FUNCTION wlast_answers();
    SQL
  end
end
