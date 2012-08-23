SET SESSION storage_engine = "InnoDB";
SET SESSION time_zone = "+0:00";
ALTER DATABASE CHARACTER SET "utf8";

DROP TABLE IF EXISTS ideas;
CREATE TABLE IF NOT EXISTS ideas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    wiki VARBINARY(500) UNIQUE NOT NULL,
    pos ENUM('verb','noun','adjective','adverb','pronoun','preposition','conjunction','interjection') NOT NULL,
    lvl INT NOT NULL DEFAULT 0,
    text VARBINARY(300) NOT NULL,
    image VARBINARY(2000) NOT NULL DEFAULT '',
    definition VARBINARY(5000) NOT NULL DEFAULT '',
    example VARBINARY(5000) NOT NULL DEFAULT '',
    audio VARBINARY(2000) NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS corpus;
CREATE TABLE IF NOT EXISTS corpus (
    n1 INT NOT NULL,
    text VARBINARY(200) NOT NULL,
    pos VARBINARY(100) NOT NULL,
    n2 INT NOT NULL,
    PRIMARY KEY(text,pos) USING BTREE
);
