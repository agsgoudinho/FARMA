class FunctionCreateVersion < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION createVersion(lo integer, team integer)
      RETURNS int LANGUAGE plpgsql AS
      $BODY$
        DECLARE
          var_name VARCHAR(50);
          var_description TEXT;
          var_user INTEGER;
          lo_version INTEGER;
        BEGIN

          --------------------CÓPIA DO LO------------------------------
          SELECT name, user_id, description INTO var_name, var_user, var_description FROM los WHERE id = lo;

          INSERT INTO los_versions (name, description, user_id, lo_id, team_id)
          VALUES (var_name, var_description, var_user, lo, team) RETURNING id INTO lo_version;

          --------------------CÓPIA DAS INTRODUÇÕES------------------------------
          INSERT INTO introductions_versions (title, content, introduction_id, lo_version_id)
            SELECT i.title, i.content, i.id, lv.id
            FROM introductions as i, los_versions as lv
            WHERE i.lo_id = lv.lo_id AND lv.id = lo_version;

          --------------------CÓPIA DOS EXERCÍCIOS------------------------------
          INSERT INTO exercises_versions (title, content, exercise_id, lo_version_id)
            SELECT e.title, e.content, e.id, lv.id
            FROM exercises as e, los_versions as lv
            WHERE e.lo_id = lv.lo_id AND lv.id = lo_version;

          --------------------CÓPIA DOS PASSOS------------------------------
          INSERT INTO steps_versions (title, content, correct_answer, step_id, exercise_version_id)
            SELECT s.title, s.content, s.correct_answer, s.id, ev.id
            FROM steps as s, exercises_versions as ev
            WHERE s.exercise_id = ev.exercise_id AND ev.lo_version_id = lo_version;

          --------------------CÓPIA DAS DICAS------------------------------
          INSERT INTO tips_versions (content, number_of_tries, tip_id, step_version_id)
            SELECT t.content, t.number_of_tries, t.id, sv.id
            FROM tips as t, steps_versions as sv, exercises_versions as ev
            WHERE t.step_id = sv.step_id AND sv.exercise_version_id = ev.id AND ev.lo_version_id = lo_version;

            RETURN 0;
        END
      $BODY$;
    SQL
  end

  def down
    execute <<-SQL
      DROP FUNCTION createVersion(lo integer, team integer);
    SQL
  end
end
