<?php
function plugin_version_networkshare()
{
return array('name' => 'Network Share',
'version' => '2.0',
'author'=> 'Valentin DEVILLE, Stephane PAUTREL',
'license' => 'GPLv2',
'verMinOcs' => '2.2');
}

function plugin_init_networkshare()
{
$object = new plugins;
$object -> add_cd_entry("networkshare","other");

$object -> sql_query("CREATE TABLE IF NOT EXISTS `networkshare` (
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

function plugin_delete_networkshare()
{
$object = new plugins;
$object -> del_cd_entry("networkshare");
$object -> sql_query("DROP TABLE `networkshare`;");

}

?>
