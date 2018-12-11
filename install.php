<?php

/**
 * This function is called on installation and is used to create database schema for the plugin
 */
function extension_install_networkshare()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery("CREATE TABLE IF NOT EXISTS `networkshare` (
                              `ID` INT(11) NOT NULL AUTO_INCREMENT,
                              `HARDWARE_ID` INT(11) NOT NULL,
                              `DRIVE` VARCHAR(255) DEFAULT NULL,
                              `PATH` VARCHAR(255) DEFAULT NULL,
                              `SIZE` VARCHAR(255) DEFAULT NULL,
                              `FREESPACE` VARCHAR(255) DEFAULT NULL,
                              `QUOTA` VARCHAR(255) DEFAULT NULL,
                              PRIMARY KEY  (`ID`,`HARDWARE_ID`)
                              ) ENGINE=INNODB;");
}

/**
 * This function is called on removal and is used to destroy database schema for the plugin
 */
function extension_delete_networkshare()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `networkshare`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_networkshare()
{

}
