CREATE TABLE frame_level_data (
    frame_id INTEGER PRIMARY KEY,
    mouse_id TEXT NOT NULL,
    session_type TEXT NOT NULL,
    frame_number INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    stimulus_type TEXT NOT NULL,
    component_id INTEGER NOT NULL,
    onset_value INTEGER NOT NULL
);