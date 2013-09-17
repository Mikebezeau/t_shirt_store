<?php
	// details.php
	
	define("PATH", "includes/");
	
	include_once(PATH."sitefunctions.php");
	include_once(PATH."connectfunctions.php");
	
	settype($_GET["id"], "integer");
	
	if ($_GET["id"]) {	
		$id = $_GET["id"];

		$db = dbGetShirts();
		$query = "SELECT Shirt.ShirtID, Shirt.Price, Shirt.Description, Shirt.Title, Shirt.Colour, 
					Tag.Tag, Image.Image
			FROM Shirt
				INNER JOIN Tag
				ON Shirt.TagID = Tag.TagID
				INNER JOIN Image
				ON Shirt.ShirtID = Image.ImageID
			WHERE Shirt.ShirtID = $id AND Image.TypeID = 1";
				
		$result = mysqli_query($db, $query);
		
		//echo mysqli_error($db);
		
		while ($row = mysqli_fetch_assoc($result)) {
			$image = $row["Image"];
			$title = stripslashes($row["Title"]);
			$description = stripslashes($row["Description"]);
			$price = sprintf("$%.0f", $row["Price"]);
			$colour = stripslashes($row["Colour"]);
			$tag = stripslashes($row["Tag"]);
		} // End while
		
		// Shirt Sizes
		$query = "SELECT Size.Size
			FROM Size
			WHERE Size.SizeID IN
				(SELECT ShirtSize.SizeID
				FROM ShirtSize
				WHERE ShirtSize.ShirtID = $id)";
		
		$result = mysqli_query($db, $query);
		$sizes = columnToArray($result, "Size");
		$sizeList = buildUL($sizes, "size", "current_size");
		
		// Shirt Types
		$query = "SELECT Type.Type
			FROM Type
			WHERE Type.TypeID IN
				(SELECT ShirtType.TypeID
				FROM ShirtType
				WHERE ShirtType.ShirtID = $id)";
				
		$result = mysqli_query($db, $query);
		$types = columnToArray($result, "Type");
		$typeList = buildUL($types, "type", "current_type");
		
		// Clear results from last procedure call
		//clearResults($db, $result);
		
		// Get Recommendations
		$query = "SELECT Shirt.ShirtID, Shirt.Description, Image.Image
			FROM Shirt
				INNER JOIN Image
				ON Shirt.ShirtID = Image.ShirtID
			WHERE Image.TypeID = 1 AND Shirt.TagID IN
				(SELECT Tag.TagID
				FROM Tag
				WHERE Tag.Tag = '$tag')
			ORDER BY RAND()
			LIMIT 4";
		$result = mysqli_query($db, $query);
		
		$recItem = file_get_contents(PATH."html/shirtlist.html", true);
		$find = array("PHP_SHIRTID", "PHP_SHIRTIMAGE", "PHP_SHIRTDESC");
		
		$recList = "<ul>";
		
		while ($row = mysqli_fetch_assoc($result)) {
			$recID = $row["ShirtID"];
			$recImage = $row["Image"];
			$recDesc = $row["Description"];
			
			$replace = array($recID, $recImage, $recDesc);
			
			$recList .= str_replace($find, $replace, $recItem);
		} // End while
		
		$recList .= "</ul>";
		
		// Close DB Connection
		clearResults($db, $result);
		mysqli_close($db);
		
		// Show added to cart message
		if (!isset($_GET["m"]))
			$addMessage = "";
		else if ($_GET["m"] == "s")
			$addMessage = "Success";
		else if ($_GET["m"] == "e")
			$addMessage = "Error!";
		
		// Build Page
		$main = file_get_contents(PATH."html/details.html", true);
		
		$find = array("PHP_DEFAULTIMAGE", "PHP_TITLE", "PHP_DESCRIPTION", "PHP_PRICE",
									"PHP_COLOUR", "PHP_TAG", "PHP_SIZELIST", "PHP_TYPELIST",
									"PHP_ADDMESSAGE", "PHP_RECOMMENDATION", "PHP_SHIRTID");
									
		$replace = array($image, $title, $description, $price, $colour, $tag, $sizeList,
										 $typeList, $addMessage, $recList, $id);
		
		$main = str_replace($find, $replace, $main);
		
		echo buildPage($main, "details.css", "", "details.js");
	} // End if
	else {
		header("Location: index.php");
	} // End else
?>