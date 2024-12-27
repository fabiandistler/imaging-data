CREATE TABLE Sessioninfo (
    session_id INTEGER PRIMARY KEY,
    mouse_id TEXT NOT NULL,
    session_type TEXT NOT NULL,
    UNIQUE (mouse_id, session_type)
);

CREATE TABLE Behavior (
    frame_number INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    running_speed REAL NOT NULL,
    stimulus_type TEXT NOT NULL,
    PRIMARY KEY (frame_number, session_id),
    FOREIGN KEY (session_id) REFERENCES Sessioninfo (session_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Components Table
CREATE TABLE Components (
    component_id INTEGER PRIMARY KEY,
    onset_value INTEGER NOT NULL,
    frame_number INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    -- The ON DELETE CASCADE clause ensures that deleting a row in Behavior also deletes corresponding rows in Components
    FOREIGN KEY (frame_number, session_id) REFERENCES Behavior (frame_number, session_id) ON DELETE CASCADE ON UPDATE CASCADE
);