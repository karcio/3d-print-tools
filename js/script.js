function calculation() {
	var a, b, c, steps;
	var nSteps = "New steps: "

	a = document.getElementById("expDimention").value;
	b = document.getElementById("obsDimention").value;
	c = document.getElementById("curSteps").value;

	if (a == null || a == "", b == null || b == "", c == null || c == "") {
		alert("Please Fill All Required Field");
		return false;
	}

	if (a == 0, b == 0, c == 0) {
		alert("in some input field not allowed value");
		return false;
	}

	steps = (a / b) * c;
	newSteps = Math.round(steps * 100) / 100

	document.getElementById("value").innerHTML = nSteps + newSteps;
	console.log(newSteps);

}