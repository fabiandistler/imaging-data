-- Active: 1735046923923@@127.0.0.1@3306
-- Create Session Table
CREATE TABLE Session (
    session_id INTEGER PRIMARY KEY,
    mouse_id TEXT NOT NULL,
    session_type TEXT NOT NULL
);

-- Create Behavior Table
CREATE TABLE Behavior (
    frame_id INTEGER PRIMARY KEY,
    frame_number INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    eye_diameter REAL NOT NULL,
    stimulus_type TEXT NOT NULL,
    -- This foreign key constraint ensures that each session_id in the Behavior table
    -- corresponds to a valid session_id in the Session table, maintaining referential integrity.
    FOREIGN KEY (session_id) REFERENCES Session (session_id)
);

-- Create Components Table
CREATE TABLE Components (
    component_id INTEGER PRIMARY KEY AUTOINCREMENT,
    frame_id INTEGER NOT NULL,
    onset_value INTEGER NOT NULL,
    -- Ensure that deleting a row in Behavior also deletes corresponding rows in Components
    FOREIGN KEY (frame_id) REFERENCES Behavior (frame_id) ON DELETE CASCADE
);
