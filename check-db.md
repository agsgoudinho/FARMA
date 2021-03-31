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
