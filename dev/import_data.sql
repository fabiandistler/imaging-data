CREATE TABLE temp_table (
    frame_id INTEGER PRIMARY KEY,
    mouse_id TEXT NOT NULL,
    session_type TEXT NOT NULL,
    frame_number INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    stimulus_type TEXT NOT NULL,
    component_id INTEGER NOT NULL,
    onset_value INTEGER NOT NULL
);


-- Run import.py

-- Normalize data base

CREATE TABLE recording (
    recording_id INTEGER PRIMARY KEY,
    recording_type TEXT NOT NULL 
);

CREATE TABLE mouse (mouse_id TEXT PRIMARY KEY);

CREATE TABLE recording_per_mouse (
    recording_id INTEGER NOT NULL,
    mouse_id TEXT NOT NULL,
    PRIMARY KEY (recording_id, mouse_id),
    FOREIGN KEY (recording_id) REFERENCES recording (recording_id),
    FOREIGN KEY (mouse_id) REFERENCES mouse (mouse_id)
);

CREATE TABLE frame (
    frame_id INTEGER PRIMARY KEY,
    recording_id INTEGER NOT NULL,
    frame_number INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    stimulus_id INTEGER NOT NULL,
    FOREIGN KEY (recording_id) REFERENCES recording (recording_id),
    FOREIGN KEY (stimulus_id) REFERENCES stimulus (stimulus_id)
);

CREATE TABLE component (
    component_id INTEGER PRIMARY KEY,
    frame_id INTEGER NOT NULL,
    onset_value INTEGER NOT NULL,
    FOREIGN KEY (frame_id) REFERENCES frame (frame_id)
);

CREATE TABLE stimulus (
    stimulus_id INTEGER PRIMARY KEY AUTOINCREMENT,
    stimulus_type TEXT NOT NULL
);




-- Transfer data to new tables

-- Insert unique recordings
INSERT INTO recording (recording_type)
SELECT DISTINCT session_type AS recording_type
FROM frame_level_data;

-- Insert unique mice
INSERT INTO
    mouse (mouse_id)
SELECT DISTINCT
    mouse_id
FROM frame_level_data;

-- Insert recording per mouse manually by expanding all combinations
INSERT INTO recording_per_mouse (recording_id, mouse_id)
SELECT DISTINCT r.recording_id, m.mouse_id
FROM recording r
CROSS JOIN mouse m;

-- Insert unique stimuli
INSERT INTO
    stimulus (stimulus_type)
SELECT DISTINCT
    stimulus_type
FROM frame_level_data;

-- Insert frames
INSERT INTO
    frame (
        frame_id,
        recording_id,
        frame_number,
        running_speed,
        stimulus_id
    )
SELECT f.frame_id, f.session_type AS recording_id, f.frame_number, f.running_speed, s.stimulus_id
FROM
    frame_level_data f
    JOIN stimulus s ON f.stimulus_type = s.stimulus_type;

-- Insert components
INSERT INTO
    component (
        component_id,
        frame_id,
        onset_value
    )
SELECT
    component_id,
    frame_id,
    onset_value
FROM frame_level_data;