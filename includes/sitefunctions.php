<?php
	// ./includes/sitefunctions.php
	
	function makeCSSLink($cssFile) {
		$cssLink = file_get_contents("includes/html/cssinclude.html");
		$cssLink = str_replace("PHP_CSS", $cssFile, $cssLink);
		
		return $cssLink;
	} // End makeCSSLink
	
	function makeJSLink($jsFile) {
		$jsLink = file_get_contents("includes/html/jsinclude.html", true);
		
		$jsLink = str_replace("PHP_JS", $jsFile, $jsLink);
		
		return $jsLink;
	} // End makeJSLink
	
	function validateEmail($email) {
		//set regular expression
		$regEx = "/^\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,8}$/";
		//if email matches regex test
		return preg_match($regEx, $email);
	} //end function

	function buildUL($data, $className, $id = "", $idLocation = "0") {
		$output = "<ul>";
		
		for ($i = 0; $i < count($data); $i++) {
		
			$li = "<li><a href='#' class='$className'";
			
			if ($id && $idLocation == $i)
				$li .= " id='$id'";
			
			$li .= ">$data[$i]</a></li>";
			
			$output .= $li;
		} // End for
		
		$output .= "</ul>";
		return $output;
	} // End buildUL
	
	function buildIndexPage($signUpMessage = ""){
		//set main HTML content***********************
		//list of shirt images
		$db = dbGetShirts();
		$query = "SELECT Shirt.ShirtID, Shirt.Description, Image.Image
			FROM Shirt
				INNER JOIN Image
				ON Shirt.ShirtID = Image.ShirtID
			WHERE Image.TypeID = 1
			ORDER BY Shirt.ShirtID";
		$result = mysqli_query($db, $query);
		//echo mysqli_error($db);
		$listItem = file_get_contents(PATH."html/shirtlist.html", true);
		//initialize main content
		$main = "<ul>";
		
		$find = array("PHP_SHIRTID", "PHP_SHIRTDESC", "PHP_SHIRTIMAGE");
		
		$imgCount = 1;
		while ($row = mysqli_fetch_assoc($result)) {
			$shirtID = $row["ShirtID"];
			$description = stripslashes($row["Description"]);
			$image = $row["Image"];
			
			$replace = array($shirtID, $description, $image);
			
			$main .= str_replace($find, $replace, $listItem);
			
			//after every 16th image (4 images per row, 4 rows) insert hr image
			if($imgCount % 16 == 0)
				$main .=  '<img src="./images/hr.gif" width="740" height="40" alt=""/>';
			$imgCount++;
		} // End while
		
		$main .= "</ul>";
		
		clearResults($db, $result);
		mysqli_close($db);
		
		echo buildPage($main, 'index.css', $signUpMessage);
	} //end buildIndexPage
	
	function buildPage($main, $cssFileName = "", $signupMessage = "", $jsFileName = "", $title = "Swicked Tees") {
		$html = file_get_contents(PATH."html/template.html", true);
		
		$cssLink = ($cssFileName) ? makeCSSLink($cssFileName) : "";
		$jsLink = ($jsFileName) ? makeJSLink($jsFileName) : "";
		
		if(isset($_COOKIE['cartCount']))
			$cartCount = $_COOKIE['cartCount'];
		else
			$cartCount = 0;
		
		$find = array("PHP_CSSLINK", "PHP_JSLINK", "PHP_TITLE", "PHP_MAIN", "PHP_MESSAGE", "PHP_CART_COUNT");
		
		$replace = array($cssLink, $jsLink, $title, $main, $signupMessage, $cartCount);
		
		$html = str_replace($find, $replace, $html);
		
		return $html;
	} // End buildPage
?>