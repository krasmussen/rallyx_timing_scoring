
-- registry table should never change
CREATE TABLE IF NOT EXISTS registry (
  key   TEXT PRIMARY KEY NOT NULL,
  value TEXT
);

CREATE TABLE IF NOT EXISTS drivers (
  driver_id       INTEGER PRIMARY KEY,
  first_name      TEXT,
  last_name       TEXT,
  alt_name        TEXT, -- use this instead of first_name (nickname)
  msreg_number    TEXT,
  scca_number     TEXT,
  license_number  TEXT, -- drivers license number
  addr_line_1     TEXT,
  addr_line_2     TEXT,
  addr_city       TEXT,
  addr_state      TEXT,
  addr_zip        TEXT,
  phone           TEXT,
  email           TEXT,
  driver_note     TEXT,

  card_number     TEXT -- unique driver card number (rfid, barcode, etc.)
);

CREATE TABLE IF NOT EXISTS entries (
  entry_id        INTEGER PRIMARY KEY,
  event_id        INT NOT NULL,
  driver_id       INT NOT NULL,
  dual_driver     INT NOT NULL DEFAULT 0,
  car_year        TEXT,
  car_make        TEXT,
  car_model       TEXT,
  car_color       TEXT,
  car_number      TEXT NOT NULL DEFAULT '0',
  car_class       TEXT NOT NULL DEFAULT 'TO',
  season_points   INT NOT NULL DEFAULT 1, -- will this entry earn season points
  work_assign     TEXT,
  entry_note      TEXT,
  event_time_ms   INT,  -- total score for this entry
  event_time      TEXT,
  event_points    INT, -- season points for this event
  event_penalties TEXT, -- total penalties for event (not cones/gates)
  scored_runs     INT NOT NULL DEFAULT 0,
  scores_visible  INT NOT NULL DEFAULT 1, -- should the scores be publicly visible
  checked_in      INT NOT NULL DEFAULT 0,
  race_session    TEXT -- which session did they race in (eg. AM, PM, ...)
);

CREATE TABLE IF NOT EXISTS runs (
  run_id          INTEGER PRIMARY KEY,
  event_id        INT NOT NULL,
  entry_id        INT,
  cones           INT,
  gates           INT,
  start_time_ms   INT,  -- 0 == DNS
  finish_time_ms  INT,  -- 0 == DNF
  state           TEXT, -- started, finished, scored, tossout
  raw_time_ms     INT,
  total_time_ms   INT,
  raw_time        TEXT,
  total_time      TEXT,
  drop_run        INT NOT NULL DEFAULT 0, -- used for regions that have drop runs
  run_count       INT,
  run_note        TEXT,
  
  split_1_time_ms INT, -- split times
  split_2_time_ms INT,

  sector_1_time   TEXT, -- split_1 - start
  sector_2_time   TEXT, -- split_2 - split_1
  sector_3_time   TEXT  -- finish - split_2
);

CREATE TABLE IF NOT EXISTS times (
  time_id       INTEGER PRIMARY KEY,
  event_id      INT,
  channel       TEXT,
  time_ms       INT,
  invalid       INT NOT NULL DEFAULT 0,
  time_note     TEXT
);

CREATE TABLE IF NOT EXISTS events (
  event_id      INTEGER PRIMARY KEY,
  name          TEXT,
  location      TEXT,
  organization  TEXT,
  event_date    TEXT, -- RFC3339 format date YYYY-MM-DD
  season_name   TEXT,
  season_points INT DEFAULT 1,
  visible       INT DEFAULT 1, -- Is this event publicly visible
  event_note    TEXT,
  max_runs      INT DEFAULT 5,
  drop_runs     INT DEFAULT 0  -- just in case we need to calc it per event
);

-- per event penalties (not cones/gates)
CREATE TABLE IF NOT EXISTS penalties (
  penalty_id    INTEGER PRIMARY KEY,
  entry_id      INT NOT NULL,
  time_ms       INT DEFAULT 0,
  penalty_note  TEXT
  );
  
