### users
```sql
CREATE TABLE users(
	id serial PRIMARY KEY,
	name VARCHAR(45),
	email VARCHAR(45),
	encrypted_password VARCHAR(45)
);
```

### teams
```sql
CREATE TABLE teams(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	code VARCHAR(45),
	user_id INTEGER REFERENCES users(id)
);
```

### users_teams
```sql
CREATE TABLE users_teams(
	id SERIAL PRIMARY KEY,
	user_id INTEGER REFERENCES users(id),
	team_id INTEGER REFERENCES teams(id)
);
```
### los
```sql
CREATE TABLE los(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description TEXT,
	user_id INTEGER REFERENCES users(id)
);
```

### introductions
```sql
CREATE TABLE introductions(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	content TEXT,
	lo_id INTEGER REFERENCES los(id)
);
```

### exercises
```sql
CREATE TABLE exercises(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	content TEXT,
	lo_id INTEGER REFERENCES los(id)
);
```

### steps
```sql
CREATE TABLE steps(
	id SERIAL PRIMARY KEY,
	title VARCHAR(45),
	content TEXT,
	correct_answer TEXT,
	exercise_id INTEGER references exercises(id)
);
```

### tips
```sql
CREATE TABLE tips(
	id SERIAL PRIMARY KEY,
	content VARCHAR(100),
	number_of_tries INTEGER,
	step_id INTEGER REFERENCES steps(id)
);
```

### los_versions
```sql
CREATE TABLE los_versions(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description TEXT,
	user_id INTEGER REFERENCES users(id),
	team_id INTEGER REFERENCES teams(id),
	lo_id INTEGER REFERENCES los(id)
);
```

### introductions_versions
```sql
CREATE TABLE introductions_versions(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	content TEXT,
	introduction_id INTEGER REFERENCES introductions(id),
	lo_version_id INTEGER REFERENCES los_versions(id)
);
```

### introductions_versions
```sql
CREATE TABLE introductions_versions(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	content TEXT,
	introduction_id INTEGER REFERENCES introductions(id),
	lo_version_id INTEGER REFERENCES los_versions(id)
);
```
### exercises_versions
```sql
CREATE TABLE exercises_versions (
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	content TEXT,
	exercise_id INTEGER REFERENCES exercises(id),
	lo_version_id INTEGER REFERENCES los_versions(id)
);
```
### steps_versions
```sql
CREATE TABLE steps_versions(
	id SERIAL PRIMARY KEY,
	title VARCHAR(45),
	content TEXT,
	correct_answer TEXT,
	step_id INTEGER references steps(id),
	exercise_version_id INTEGER REFERENCES exercises_versions(id)
);
```

### tips_versions
```sql
CREATE TABLE tips_versions(
	id SERIAL PRIMARY KEY,
	content VARCHAR(100),
	number_of_tries INTEGER,
	tip_id INTEGER references tips(id),
	step_version_id INTEGER REFERENCES steps_versions(id)
);
```
### tips_counts
```sql
CREATE TABLE tips_counts(
	id SERIAL PRIMARY KEY,
	tries INTEGER,
	step_version_id INTEGER REFERENCES steps_versions(id),
	user_id INTEGER REFERENCES users(id),
	team_id INTEGER REFERENCES teams(id)
);
```
### answers
```sql
CREATE TABLE answers(
	id SERIAL PRIMARY KEY,
	response TEXT,
	correct BOOLEAN,
	attempt_number INTEGER,
	user_id INTEGER REFERENCES users(id),
	team_id INTEGER REFERENCES teams(id),
	step_version_id INTEGER REFERENCES steps_versions(id),
  last_answers INTEGER[] DEFAULT '{}'::INTEGER[]
);
```
