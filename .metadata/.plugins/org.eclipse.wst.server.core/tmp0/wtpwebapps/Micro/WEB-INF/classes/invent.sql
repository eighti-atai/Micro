CREATE TABLE IF NOT EXISTS micro.part_category_tab (
	category VARCHAR(30) NOT NULL PRIMARY KEY,
	description VARCHAR(1000) NOT NULL,
	objid VARCHAR(1000) NOT NULL)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `micro`.`inventory_part_tab` (
  `inv_part_no` VARCHAR(30) NOT NULL PRIMARY KEY,
  `description` VARCHAR(200) NULL,
  `category` VARCHAR(30) NULL,
  `uom_id` VARCHAR(10) NULL,
  `reorder_level` DOUBLE NULL,
  `safety_stock_level` DOUBLE NULL,
  objid VARCHAR(1000) NOT NULL)
ENGINE = InnoDB;
  

CREATE TABLE IF NOT EXISTS `micro`.`inventory_part_cost_tab` ( 
`site_id` VARCHAR(5) NOT NULL,
`inv_part_no` VARCHAR(10) NOT NULL,   
`inv_part_cost_no` INT NOT NULL,   
`cost` NUMERIC(20,2) NULL, 
`quantity` NUMERIC(20,2) NULL,
`objid` VARCHAR(1000) NOT NULL,
PRIMARY KEY (`inv_part_no`, `inv_part_cost_no`)) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `unter`.`inv_part_in_stock_tab` (   
`inv_part_no` VARCHAR(10) NOT NULL,   
`inv_part_cost_no` INT NOT NULL,   
`site_id` VARCHAR(5) NOT NULL,
`inv_location_id` VARCHAR(5) NOT NULL,
`stock_qty` int,   
PRIMARY KEY (`inv_part_no`, `inv_part_cost_no`, `site_id`, `inv_location_id`))	ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `unter`.`uom_tab` (
  `uom_id` VARCHAR(10) NOT NULL,
  `description` VARCHAR(100) NULL,
  `objid` VARCHAR(1000) NULL,
  PRIMARY KEY (`uom_id`));

