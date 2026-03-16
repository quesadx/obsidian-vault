CREATE SCHEMA IF NOT EXISTS `zombie_system` DEFAULT CHARACTER SET utf8mb4;
USE `zombie_system`;

-- 1. ACCESS CONTROL (Roles & Permissions)
CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(100) NOT NULL COMMENT 'Code key for React/Frontend checks (e.g., inventory.edit)',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC)) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_id` INT UNSIGNED NOT NULL,
  `permission_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`),
  CONSTRAINT `fk_rp_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rp_perm` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE) ENGINE = InnoDB;

-- 2. INFRASTRUCTURE (Camps)
CREATE TABLE IF NOT EXISTS `camps` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `status` ENUM('ACTIVE', 'COMPROMISED', 'DESTROYED') NOT NULL DEFAULT 'ACTIVE',
  `location_description` VARCHAR(255) NOT NULL,
  `server_sync_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)) ENGINE = InnoDB;

-- 3. HUMAN RESOURCES (Survivors & Professions)
CREATE TABLE IF NOT EXISTS `professions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `food_production_rate` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `water_production_rate` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `survivors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `camp_id` INT UNSIGNED NOT NULL,
  `profession_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `health_status` ENUM('HEALTHY', 'SICK', 'INJURED', 'AWAY') NOT NULL DEFAULT 'HEALTHY',
  `photo_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_survivors_camps` FOREIGN KEY (`camp_id`) REFERENCES `camps` (`id`),
  CONSTRAINT `fk_survivors_professions` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`)) ENGINE = InnoDB;

-- 4. LOGISTICS & ECONOMY (Resources & Inventory)
CREATE TABLE IF NOT EXISTS `resources` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` ENUM('FOOD', 'WATER', 'HYGIENE', 'DEFENSE') NOT NULL,
  PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `camp_inventory` (
  `camp_id` INT UNSIGNED NOT NULL,
  `resource_id` INT UNSIGNED NOT NULL,
  `current_quantity` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  `min_threshold` DECIMAL(12,2) NOT NULL DEFAULT 10.00,
  PRIMARY KEY (`camp_id`, `resource_id`),
  CONSTRAINT `fk_inv_camp` FOREIGN KEY (`camp_id`) REFERENCES `camps` (`id`),
  CONSTRAINT `fk_inv_res` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`)) ENGINE = InnoDB;

-- 5. OPERATIONS (Explorations & Requests)
CREATE TABLE IF NOT EXISTS `explorations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `camp_id` INT UNSIGNED NOT NULL,
  `status` ENUM('SCHEDULED', 'ONGOING', 'COMPLETED', 'MISSING') DEFAULT 'SCHEDULED',
  `start_date` DATETIME NOT NULL,
  `estimated_return` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_exp_camp` FOREIGN KEY (`camp_id`) REFERENCES `camps` (`id`)) ENGINE = InnoDB;

-- 6. SYSTEM USERS
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` INT UNSIGNED NOT NULL,
  `camp_id` INT UNSIGNED NULL COMMENT 'Null if user is a global admin',
  `username` VARCHAR(50) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `status` ENUM('ACTIVE', 'INACTIVE', 'SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
  `last_activity_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_user_camp` FOREIGN KEY (`camp_id`) REFERENCES `camps` (`id`)) ENGINE = InnoDB;
