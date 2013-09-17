<?php
	// addcart.php
	define("PATH", "includes/");
	
	include_once(PATH."connectfunctions.php");
		
	settype($_POST["id"], "integer");
	
	$typeRegEx = "/^[A-Za-z]{4,20}$/";
	$sizeRegEx = "/^\d?[LMSXlmsx]{1,2}$/";
	
	if ($_POST["id"] && preg_match($typeRegEx, $_POST["type"]) && preg_match($sizeRegEx, $_POST["size"])) {
	
		$shirtID = $_POST["id"];
		$type = $_POST["type"];
		$size = $_POST["size"];
	
		session_set_cookie_params(31556926);
		session_start();
		
		$db = dbAddShirts();
		
		$result = mysqli_query($db, "CALL getCart('".session_id()."')");
		
		if (mysqli_num_rows($result)) {
			while ($row = mysqli_fetch_assoc($result)) {
				$cartID = $row["CartID"];
			} // End while
		} // End if
		else {
			// Make them a cart
			clearResults($db, $result);
			$result = mysqli_query($db, "CALL addCart('".session_id()."')");
			$row = mysqli_fetch_assoc($result);
			$cartID = $row["intRecordKey"];
		} // End else

		clearResults($db, $result);
		
		$query = "CALL addShirt($cartID, $shirtID, '$type', '$size')";
		$result = mysqli_query($db, $query);

		$messageCode = ($result) ? 's' : 'e';
		
		//clearResults($db, $result);
		mysqli_close($db);	
		
		if($messageCode == 's') {
			if(isset($_COOKIE['cartCount'])) {
				$cartCount = ++$_COOKIE['cartCount'];
				setcookie('cartCount', $cartCount, time() + 31556926, '/', 'localhost', 0);
			} //end if
			else
				setcookie('cartCount', '1', time() + 31556926, '/', 'localhost', 0);
		} //end if item added to cart
		
		$url = "./details.php?id=$shirtID&m=$messageCode";
	
		header("Location: $url");
	} // End if
	else {
		header("Location: ./index.php");
	} // End else
?>