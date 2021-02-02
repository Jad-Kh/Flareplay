-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema flareplaydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flareplaydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flareplaydb` DEFAULT CHARACTER SET latin1 ;
USE `flareplaydb` ;

-- -----------------------------------------------------
-- Table `flareplaydb`.`requirements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`requirements` (
  `req_id` VARCHAR(45) NOT NULL,
  `req_processor` VARCHAR(45) NOT NULL,
  `req_memory` VARCHAR(45) NOT NULL,
  `req_graphics` VARCHAR(45) NOT NULL,
  `req_storage` VARCHAR(45) NOT NULL,
  `req_soundcard` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`req_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`series` (
  `series_name` VARCHAR(95) NOT NULL,
  `series_numofgames` INT(11) NOT NULL,
  PRIMARY KEY (`series_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`game` (
  `game_name` VARCHAR(50) NOT NULL,
  `game_cost` DOUBLE NOT NULL,
  `game_releasedate` VARCHAR(45) NOT NULL,
  `game_mainpic` VARCHAR(100) NOT NULL,
  `game_company` VARCHAR(45) NOT NULL,
  `game_youtubetrailer` VARCHAR(45) NOT NULL,
  `series_name` VARCHAR(95) NOT NULL,
  `req_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game_name`, `series_name`, `req_id`),
  INDEX `fk_game_requirements1` (`req_id` ASC) VISIBLE,
  INDEX `fk_game_series1` (`series_name` ASC) VISIBLE,
  CONSTRAINT `fk_game_requirements1`
    FOREIGN KEY (`req_id`)
    REFERENCES `flareplaydb`.`requirements` (`req_id`),
  CONSTRAINT `fk_game_series1`
    FOREIGN KEY (`series_name`)
    REFERENCES `flareplaydb`.`series` (`series_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`article` (
  `article_name` VARCHAR(50) NOT NULL,
  `article_mainpic` VARCHAR(95) NOT NULL,
  `article_pic1` VARCHAR(95) NOT NULL,
  `article_pic2` VARCHAR(95) NOT NULL,
  `article_pic3` VARCHAR(95) NOT NULL,
  `article_pic4` VARCHAR(95) NOT NULL,
  `game_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`article_name`, `game_name`),
  INDEX `fk_article_game1` (`game_name` ASC) VISIBLE,
  CONSTRAINT `fk_article_game1`
    FOREIGN KEY (`game_name`)
    REFERENCES `flareplaydb`.`game` (`game_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`activity` (
  `activity_id` INT(11) NOT NULL,
  `activity_pic` VARCHAR(95) NOT NULL,
  `activity_title` VARCHAR(95) NOT NULL,
  `activity_type` VARCHAR(45) NOT NULL,
  `article_name` VARCHAR(50) NOT NULL,
  `articlegame_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`activity_id`, `article_name`, `articlegame_name`),
  INDEX `fk_activity_article1` (`article_name` ASC, `articlegame_name` ASC) VISIBLE,
  CONSTRAINT `fk_activity_article1`
    FOREIGN KEY (`article_name` , `articlegame_name`)
    REFERENCES `flareplaydb`.`article` (`article_name` , `game_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`launcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`launcher` (
  `launcher_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`launcher_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`game_launcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`game_launcher` (
  `game_name` VARCHAR(50) NOT NULL,
  `launcher_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`game_name`, `launcher_name`),
  INDEX `fk_game_has_launcher_launcher1` (`launcher_name` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_launcher_game1`
    FOREIGN KEY (`game_name`)
    REFERENCES `flareplaydb`.`game` (`game_name`),
  CONSTRAINT `fk_game_has_launcher_launcher1`
    FOREIGN KEY (`launcher_name`)
    REFERENCES `flareplaydb`.`launcher` (`launcher_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`user` (
  `user_name` VARCHAR(95) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`list` (
  `list_id` VARCHAR(95) NOT NULL,
  `list_name` VARCHAR(45) NOT NULL,
  `list_numofgames` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`list_id`, `user_name`),
  INDEX `fk_list_user` (`user_name` ASC) VISIBLE,
  CONSTRAINT `fk_list_user`
    FOREIGN KEY (`user_name`)
    REFERENCES `flareplaydb`.`user` (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`game_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`game_list` (
  `game_name` VARCHAR(50) NOT NULL,
  `list_id` VARCHAR(95) NOT NULL,
  `user_name` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`game_name`, `list_id`, `user_name`),
  INDEX `fk_game_has_list_list1` (`list_id` ASC, `user_name` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_list_game1`
    FOREIGN KEY (`game_name`)
    REFERENCES `flareplaydb`.`game` (`game_name`),
  CONSTRAINT `fk_game_has_list_list1`
    FOREIGN KEY (`list_id` , `user_name`)
    REFERENCES `flareplaydb`.`list` (`list_id` , `user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`tag` (
  `tag_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`tag_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`game_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`game_tag` (
  `game_name` VARCHAR(50) NOT NULL,
  `tag_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`game_name`, `tag_name`),
  INDEX `fk_game_has_tag_tag1` (`tag_name` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_tag_game1`
    FOREIGN KEY (`game_name`)
    REFERENCES `flareplaydb`.`game` (`game_name`),
  CONSTRAINT `fk_game_has_tag_tag1`
    FOREIGN KEY (`tag_name`)
    REFERENCES `flareplaydb`.`tag` (`tag_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`opsystem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`opsystem` (
  `opsystem_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`opsystem_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`opsystem_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`opsystem_game` (
  `opsystem_name` VARCHAR(50) NOT NULL,
  `game_name` VARCHAR(50) NOT NULL,
  `req_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`opsystem_name`, `game_name`, `req_id`),
  CONSTRAINT `fk_opsystem_has_game_opsystem1`
    FOREIGN KEY (`opsystem_name`)
    REFERENCES `flareplaydb`.`opsystem` (`opsystem_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`slideshow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`slideshow` (
  `slideshow_name` VARCHAR(95) NOT NULL,
  `slideshow_pic1` VARCHAR(95) NOT NULL,
  `slideshow_pic2` VARCHAR(95) NOT NULL,
  `slideshow_pic3` VARCHAR(95) NOT NULL,
  `slideshow_pic4` VARCHAR(95) NOT NULL,
  `slideshow_pic5` VARCHAR(95) NOT NULL,
  `slideshow_pic6` VARCHAR(95) NOT NULL,
  `slideshow_pic7` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`slideshow_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`page`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`page` (
  `page_name` VARCHAR(45) NOT NULL,
  `page_background` VARCHAR(45) NOT NULL,
  `article_name` VARCHAR(50) NOT NULL,
  `articlegame_name` VARCHAR(50) NOT NULL,
  `game_name` VARCHAR(50) NOT NULL,
  `slideshow_name` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`page_name`, `article_name`, `articlegame_name`, `game_name`, `slideshow_name`),
  INDEX `fk_page_article1` (`article_name` ASC, `articlegame_name` ASC) VISIBLE,
  INDEX `fk_page_game1` (`game_name` ASC) VISIBLE,
  INDEX `fk_page_slideshow1` (`slideshow_name` ASC) VISIBLE,
  CONSTRAINT `fk_page_article1`
    FOREIGN KEY (`article_name` , `articlegame_name`)
    REFERENCES `flareplaydb`.`article` (`article_name` , `game_name`),
  CONSTRAINT `fk_page_game1`
    FOREIGN KEY (`game_name`)
    REFERENCES `flareplaydb`.`game` (`game_name`),
  CONSTRAINT `fk_page_slideshow1`
    FOREIGN KEY (`slideshow_name`)
    REFERENCES `flareplaydb`.`slideshow` (`slideshow_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`review` (
  `review_code` INT(11) NOT NULL,
  `review_title` VARCHAR(45) NOT NULL,
  `review_desc` VARCHAR(4000) NOT NULL,
  `review_recommend` TINYINT(1) NOT NULL,
  `game_name` VARCHAR(50) NOT NULL,
  `user_name` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`review_code`, `game_name`, `user_name`),
  INDEX `fk_review_game1` (`game_name` ASC) VISIBLE,
  INDEX `fk_review_user1` (`user_name` ASC) VISIBLE,
  CONSTRAINT `fk_review_game1`
    FOREIGN KEY (`game_name`)
    REFERENCES `flareplaydb`.`game` (`game_name`),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_name`)
    REFERENCES `flareplaydb`.`user` (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `flareplaydb`.`user_launcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flareplaydb`.`user_launcher` (
  `user_name` VARCHAR(95) NOT NULL,
  `launcher_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_name`, `launcher_name`),
  INDEX `fk_user_has_launcher_launcher1` (`launcher_name` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_launcher_launcher1`
    FOREIGN KEY (`launcher_name`)
    REFERENCES `flareplaydb`.`launcher` (`launcher_name`),
  CONSTRAINT `fk_user_has_launcher_user1`
    FOREIGN KEY (`user_name`)
    REFERENCES `flareplaydb`.`user` (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
