-- Vytvoření tabulek (SQLite verze)
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    completed INTEGER DEFAULT 0,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- INSERT
INSERT INTO users (name) VALUES ('Petr');
INSERT INTO tasks (user_id, title) VALUES (1, 'Nakoupit');
INSERT INTO tasks (user_id, title) VALUES (1, 'Uklidit pokoj');

-- UPDATE
UPDATE tasks SET completed = 1 WHERE id = 1;

-- DELETE
DELETE FROM tasks WHERE id = 2;

-- SELECT – základ
SELECT * FROM tasks;

-- SELECT + WHERE
SELECT * FROM tasks WHERE completed = 0;

-- JOIN
SELECT tasks.title, users.name
FROM tasks
JOIN users ON tasks.user_id = users.id;

-- ORDER BY
SELECT * FROM tasks ORDER BY created_at DESC;

-- GROUP BY + COUNT
SELECT user_id, COUNT(*) AS pocet_ukolu
FROM tasks
GROUP BY user_id;

-- Poddotaz (subquery)
SELECT *
FROM tasks
WHERE user_id = (
    SELECT id FROM users WHERE name = 'Petr'
);
