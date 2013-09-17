/*
	Author:
	Created On:
	Revised On:
	Language: JavaScript
	
	Purpose:
	
	Related Files:
*/

//getElementById shorthand function
var $id = function (id) {
	return document.getElementById(id);
} // End $id


//get elements by class name, compatible with IE
function getElementsByClassName(className) {
	var elements = new Array();
	var allElements = document.getElementsByTagName("*");
	
	for (var i = 0; i < allElements.length; i++) {
		if (allElements[i].className == className)
			elements.push(allElements[i]);
	} // End for

	return elements;
} // End getElementsByClassName

//binding event to event handlers
function addEvent(object, eventName, functionName, capture){
	//following true if browser == EI
	if(object.attachEvent) {
		object.attachEvent("on" + eventName, functionName);
	} //end if EI
	//else is another browser
	else if(object.addEventListener) {
		object.addEventListener(eventName, functionName, capture);
	} //end else other browser, not EI
} //end addEvent

//removing event from event handlers
function removeEvent(object, eventName, functionName, capture){
		//following true if browser == EI
	if(object.detachEvent) {
		object.detachEvent("on" + eventName, functionName);
	} //end if EI
	//else is another browser
	else if(object.removeEventListener) {
		object.removeEventListener(eventName, functionName, capture);
	} //end else other browser, not EI
} //end