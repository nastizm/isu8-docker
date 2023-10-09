DROP DATABASE IF EXISTS torb; CREATE DATABASE torb;
USE torb;

CREATE USER 'isucon'@'%' IDENTIFIED BY 'isucon';
GRANT ALL ON torb.* TO 'isucon'@'%';
CREATE USER 'isucon'@'localhost' IDENTIFIED BY 'isucon';
GRANT ALL ON torb.* TO 'isucon'@'localhost';

CREATE TABLE IF NOT EXISTS users (
    id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nickname    VARCHAR(128) NOT NULL,
    login_name  VARCHAR(128) NOT NULL,
    pass_hash   VARCHAR(128) NOT NULL,
    UNIQUE KEY login_name_uniq (login_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS events (
    id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(128)     NOT NULL,
    public_fg   TINYINT(1)       NOT NULL,
    closed_fg   TINYINT(1)       NOT NULL,
    price       INTEGER UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sheets (
    id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `rank`      VARCHAR(128)     NOT NULL,
    num         INTEGER UNSIGNED NOT NULL,
    price       INTEGER UNSIGNED NOT NULL,
    UNIQUE KEY rank_num_uniq (`rank`, num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS reservations (
    id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    event_id    INTEGER UNSIGNED NOT NULL,
    sheet_id    INTEGER UNSIGNED NOT NULL,
    user_id     INTEGER UNSIGNED NOT NULL,
    reserved_at DATETIME(6)      NOT NULL,
    canceled_at DATETIME(6)      DEFAULT NULL,
    KEY event_id_and_sheet_id_idx (event_id, sheet_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS administrators (
    id          INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nickname    VARCHAR(128) NOT NULL,
    login_name  VARCHAR(128) NOT NULL,
    pass_hash   VARCHAR(128) NOT NULL,
    UNIQUE KEY login_name_uniq (login_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE reservations DROP KEY event_id_and_sheet_id_idx;
ALTER TABLE reservations ADD KEY event_id_and_sheet_id_idx (event_id, sheet_id);

