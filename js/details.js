/*
	Author:
	Created On:
	Revised On:
	Language: JavaScript
	
	Purpose:
	
	Related Files:
*/

//window.onload = initDetails;
addEvent(window, 'load', initDetails, true);

 //INITIALIZATION *************************
function initDetails() {
	//alert("details onload");
	
	var links = getElementsByClassName("type");
	
	for (var i = 0; i < links.length; i++) {
		links[i].onclick = onClickType;
	} // End for
	
	links = getElementsByClassName("size");
	
	for (var i = 0; i < links.length; i++) {
		links[i].onclick = onClickSize;
	} // End for
} // End init

//EVENT HANDLERS *************************
function onClickType() {
	$id("selected_type").innerHTML = this.innerHTML;
	$id("current_type").id = "";
	this.id = "current_type";
	
	$id("details").type.value = this.innerHTML;
	
	//stop link from acting on default behaviour
	return false;
} // End onClickType

function onClickSize() {
	$id("selected_size").innerHTML = this.innerHTML;
	$id("current_size").id = "";
	this.id = "current_size";
	
	$id("details").size.value = this.innerHTML;
	
	//stop link from acting on default behaviour
	return false;
} // End onClickSize