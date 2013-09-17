<?php
	function connect($host, $user, $password, $database) {
		$db = mysqli_connect($host, $user, $password, $database);
	
		if (mysqli_connect_errno()) {
			echo "Error connecting to database: ".mysqli_connect_error();
			exit();
		} // End if
	
		return $db;
	} // End connect
	/*
	function dbEmail() {
		return connect("localhost", "addemail", "html1234", "subscription");
	} // End dbEmail
	
	function dbDeleteEmail() {
		return connect("localhost", "deleteemail", "html1234", "subscription");
	} //end dbDeleteEmail
	
	function dbGetShirts() {
		return connect("localhost", "getShirts", "html1234", "store");
	} // End dbGetShirts
	
	function dbAddShirts() {
		return connect("localhost", "addShirts", "html1234", "store");
	} // End dbGetShirts
	*/
	
	function dbEmail() {
		return connect("mysql17.000webhost.com", "a6103303_shirt", "canItbe1", "subscription");
	} // End dbEmail
	
	function dbDeleteEmail() {
		return connect("mysql17.000webhost.com", "a6103303_shirt", "canItbe1", "subscription");
	} //end dbDeleteEmail
	
	function dbGetShirts() {
		return connect("mysql17.000webhost.com", "a6103303_shirt", "canItbe1", "a6103303_store");
	} // End dbGetShirts
	
	function dbAddShirts() {
		return connect("mysql17.000webhost.com", "a6103303_shirt", "canItbe1", "a6103303_store");
	} // End dbGetShirts
	
	// Database functions
	
	function clearResults($db, $result) {
		mysqli_free_result($result);

		while (mysqli_next_result($db) && mysqli_more_results($db)) {
			
			$result = mysqli_use_result($db);
			if ($result instanceof mysqli_result)
				mysqli_free_result($result);
		} // End while
	} // End clearResults
	
	function getNextResult($db, $result) {
		mysqli_free_result($result);
		mysqli_next_result($db);
		return mysqli_use_result($db);
	} // End getNextResult
	
	function columnToArray($result, $columnName) {
		$a = array();
		
		while ($row = mysqli_fetch_assoc($result))
			array_push($a, $row[$columnName]);
			
		return $a;
	} // End columnToArray
?>