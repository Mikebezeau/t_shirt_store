/*
	Author:
	Created On:
	Revised On:
	Language: JavaScript
	
	Purpose:
	
	Related Files:
*/

//window.onload = bindingTest;
addEvent(window, 'load', bindingTest, true);

//testing binding multiple events to one event
function bindingTest(){
	//alert("main onload");
} //end bindingTest

//jquery event binding
$(document).ready(function() {
   initMain();
 });

 //INITIALIZATION *************************
function initMain() {
	//alert("main jquery onload");
	
	$id("signup_form").onsubmit = checkForm;
	
	$("#search_text").click(function() {
		this.select();
	});
	
	$("#email_text").click(function() {
		this.select();
	});
	
	
} //end init

//EVENT HANDLERS *************************
function checkForm() {
	var regx = /^\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,8}$/;

	if (regx.test($("signup").email.value))
		return true;
	else {
		$("signup_message").innerHTML = "Invalid Email";
		
		return false;
	} // End else
} // End checkForm

//METHODS *************************
function showElem(element) {
	//alert(element);
	var myElem = document.getElementById(element);
	//alert("display: " + myElem.style.display);
	
	if(myElem.style.display == 'block') {
		//alert('hide me');
		myElem.style.display = 'none'
		}
	else {
		//alert('show me');
		myElem.style.display = 'block'
	}
} //end showElem

function flipArrow(element) {
	var myElem = document.getElementById(element);
	//alert("display: " + myElem.style.backgroundPosition);
	
	if(myElem.style.backgroundPosition == '150px -25px') {
		myElem.style.backgroundPosition  = '150px 0px';
		}
	else {
		myElem.style.backgroundPosition  = '150px -25px';
	}
} //end flipArrow
