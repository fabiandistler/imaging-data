CREATE TABLE frame_level_data (
    frame_id INTEGER PRIMARY KEY,
    
    
    frame_number INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    stimulus_type TEXT NOT NULL,
    component_id INTEGER NOT NULL,
    onset_value INTEGER NOT NULL
);

CREATE TABLE mouse (
mouse_id TEXT PRIMARY KEY

);

CREATE TABLE session (
session_id TEXT PRIMARY KEY,
session_type TEXT NOT NULL

);

CREATE TABLE session_per_mouse (
session_id TEXT PRIMARY KEY,
mouse_id TEXT PRIMARY KEY

);