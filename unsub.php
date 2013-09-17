<?php
	//process user choice to stay subsribed or un-subscribe

	//unsub.php
	define("PATH", "includes/");
	
	include_once(PATH."connectfunctions.php");
	include_once(PATH."sitefunctions.php");

	//user choose to stay subscribed
	if($_POST['choice'] == 'stay')
		header("Location: index.php");
	//else value == 'go', unsubscribe user
	else {
		//get email address
		$email = $_POST["email"];
		//if email matches regex test
		if (validateEmail($email)) {
			//connect to database
			$db = dbDeleteEmail();
			//sanitize input email address
			$email = mysqli_real_escape_string($db, $email);
			//get INSERT query
			$query = file_get_contents(PATH."sql/delete_email.sql", true);
			//set input email into query
			$query = str_replace("PHP_EMAIL", $email, $query);
			//run query
			if($results = mysqli_query($db, $query)) {
				//show confirmation page
				//get HTML template file
				$html = file_get_contents(PATH."html/template.html", true);
				
				//get page specific CSS link
				$cssLink = makeCSSLink("message.css");
				
				//set page title
				$title = "Swicked Tees - Newsletter Unsubscribe";
				
				//newsletter subscription signup message
				$signUpMessage = '';
				
				//set main HTML content
				$main = file_get_contents(PATH."html/unsub_confirm.html");
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
			} //end if results
			else {
				echo mysqli_error ($db);
			}
			mysqli_close($db);
			
		} //end if valid email
	} //end else
	
?>