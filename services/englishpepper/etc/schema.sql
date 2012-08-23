SET SESSION storage_engine = "InnoDB";
SET SESSION time_zone = "+0:00";
ALTER DATABASE CHARACTER SET "utf8";

DROP TABLE IF EXISTS ideas;
CREATE TABLE IF NOT EXISTS ideas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    wiki_url VARBINARY(500) UNIQUE NOT NULL,
    pos ENUM('verb','noun','adjective','adverb','pronoun','preposition','conjunction','interjection') NOT NULL,
    text VARBINARY(300) NOT NULL,
    image VARBINARY(500) NOT NULL DEFAULT '',
    definition VARBINARY(5000) NOT NULL DEFAULT '',
    example VARBINARY(5000) NOT NULL DEFAULT ''
);
