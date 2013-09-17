<?php
	//display success message if email added to database, or option to unsubscribe if email already in database

	//signup.php
	define("PATH", "includes/");
	
	include_once(PATH."connectfunctions.php");
	include_once(PATH."sitefunctions.php");

	//if an email has been entered
	if (!empty($_POST["email"])) {
		//get email
		$email = $_POST["email"];
		//if email is valid
		if (validateEmail($email)) {
			//connect to database
			$db = dbEmail();
			//sanitize input email address
			$email = mysqli_real_escape_string($db, $email);
			//get INSERT query
			$query = file_get_contents(PATH."sql/insert_email.sql");
			//set input email into query
			$query = str_replace("PHP_EMAIL", $email, $query);
			//run query
			$results = mysqli_query($db, $query);	
			
			//if email exists in database
			//give user option to unsubscribe
			if (mysqli_errno($db) == 1062) {
				//get HTML template file
				$html = file_get_contents(PATH."html/template.html", true);
				
				//get page specific CSS link
				$cssLink = makeCSSLink("message.css");
				
				//set page title
				$title = "Swicked Tees - Newsletter Unsubscribe";
				
				//newsletter subscription signup message
				$signUpMessage = '';
				
				//set main HTML content
				$main = file_get_contents(PATH."html/unsub.html");
				//PHP_DELETE_EMAIL is the users email address, carried forward for use in DELETE query upon user request to un-subscribe
				$main = str_replace("PHP_EMAIL", $email, $main);
				
				//set array to find elements from the template page
				$find = array("PHP_CSSLINK", "PHP_JSLINK", "PHP_TITLE", "PHP_MESSAGE", "PHP_MAIN");
				//set replace array with page specific CSS and HTML content
				$replace = array($cssLink, $jsLink, $title, $signUpMessage, $main);
				//replace find elements with the CSS and HTML content
				$html = str_replace($find, $replace, $html);
				//output HTML page to user
				echo $html;				
			} // End inner if
			//else connection made and query run successfuly
			//user now subscribed
			else {
				buildIndexPage('Success');	
			} //end else
		} // End inner if
		else
			buildIndexPage('Invalid email');
			
	} // End outer if
	
	//else email field is empty
	else{
		//return to index page
		buildIndexPage('Invalid email');
	}
?>