CREATE TABLE recording (
    recording_id TEXT PRIMARY KEY,
    recording_type TEXT NOT NULL
);

CREATE TABLE mouse (mouse_id TEXT PRIMARY KEY);

CREATE TABLE recording_per_mouse (
    recording_id TEXT NOT NULL,
    mouse_id TEXT NOT NULL,
    PRIMARY KEY (recording_id, mouse_id),
    FOREIGN KEY (recording_id) REFERENCES recording(recording_id),
    FOREIGN KEY (mouse_id) REFERENCES mouse(mouse_id)
);

CREATE TABLE frame (
    frame_id INTEGER PRIMARY KEY,
    recording_id TEXT NOT NULL,
    frame_number INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    stimulus_type TEXT NOT NULL,
    FOREIGN KEY (recording_id) REFERENCES recording(recording_id)
);

CREATE TABLE component (
    component_id INTEGER PRIMARY KEY,
    frame_id INTEGER NOT NULL,
    onset_value INTEGER NOT NULL,
    FOREIGN KEY (frame_id) REFERENCES frame(frame_id)
);