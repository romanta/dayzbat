<?php
	$worldid 			= 5;
	$dbhost 			= "localhost"; 
	$dbname			= "dayz_panthera";
	$dbuser			= "";
	$dbpass			= "";
	$dbport				= 3306;
	$serverinstance	= 1;

	// Only use this with DayzCC
	require_once('C:\arma\@dayzcc\htdocs\dayz\modules\lib\class.vehicles.php');
	$generation = new vehicle_generator(new mysqli($dbhost.':'.$dbport, $dbuser, $dbpass, $dbname));
	$generation->setDatabaseName($dbname);
	$generation->setInstanceID($serverinstance);
	$generation->setWorldID($worldid);
	$generation->execute();
?>