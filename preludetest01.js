// Name some element variables that will be set to the HTML DOM elements and P5js elements.
var startbuttonelem;
var questiontitle1elem;
var questiontitle2elem;
var terminallabelelem;
var terminaltextelem;
var answerlabelelem;
var answerboxelem;
var scoretextelem;
var messagelabelelem;
var messagetextelem;
var dark1colorbuttonelem;
var dark2colorbuttonelem;
var semidarkcolorbuttonelem;
var lightcolorbuttonelem;
var showcolorbuttonsbuttonelem;
var hidecolorbuttonsbuttonelem;
var setgamemodembuttonelem;
var setgamemodedbuttonelem;
var setgamemodebbuttonelem;
var showgamemodebuttonsbuttonelem;
var hidegamemodebuttonsbuttonelem;
var setdeck1Abuttonelem;
var setdeck1Bbuttonelem;
var setdeck1Cbuttonelem;
var setdeck1Dbuttonelem;
var setdeck1allbuttonelem;
var showdeckbuttonsbuttonelem;
var hidedeckbuttonsbuttonelem;

// Name some variables for colors.
var termBG;
var termFG01;
var termFG02;
var termFG03;
var termFG04;
var termFG05;
var termFG06;

// Set some of the variables that change when game things happen.
var score = 0;
var gamemode = "minexanddesc";
var currentgamemodedescription = "Name that function: from description and minimal example";
var gamewinningscore = 50;
var gameisover = 0;
var questionnum = 999;
var answer = "foo this answer should change before a question goes up";
var currentdeck = Q1Ball;
var currentdeckdescription = "Prelude vocab level 1B"
var currentsubdeck = currentdeck[0];
var currentquestioncard = currentsubdeck[0];

// Define color object for color schemes.
var colorRGB = function(inpR, inpG, inpB) {
	this.R = inpR;
	this.G = inpG;
	this.B = inpB;
}

function setup() {
	// Some things to do when the page loads.
	noCanvas();
	// Matching element variables to their ids.
	startbuttonelem = select("#startbuttonid");
	questiontitle1elem = select("#questiontitle1id");
	questiontitle2elem = select("#questiontitle2id");
	terminallabelelem = select("#terminallabelid");
	terminaltextelem = select("#terminaltextid");
	answerlabelelem = select("#answerlabelid");
	answerboxelem = select("#answerboxid");
	scoretextelem = select("#scoretextid");
	messagetlabelelem = select("#messagelabelid");
	messagetextelem = select("#messagetextid");
	dark1colorbuttonelem = select("#dark1colorbuttonid");
	dark2colorbuttonelem = select("#dark2colorbuttonid");
	semidarkcolorbuttonelem = select("#semidarkcolorbuttonid");
	lightcolorbuttonelem = select("#lightcolorbuttonid");
	showcolorbuttonsbuttonelem = select("#showcolorbuttonsbuttonid");
	hidecolorbuttonsbuttonelem = select("#hidecolorbuttonsbuttonid");
	setgamemodembuttonelem = select("#setgamemodembuttonid");
	setgamemodedbuttonelem = select("#setgamemodedbuttonid");
	setgamemodebbuttonelem = select("#setgamemodebbuttonid");
	showgamemodebuttonsbuttonelem = select("#showgamemodebuttonsbuttonid");
	hidegamemodebuttonsbuttonelem = select("#hidegamemodebuttonsbuttonid");
	setdeck1Abuttonelem = select("#setdeck1Abuttonid");
	setdeck1Bbuttonelem = select("#setdeck1Bbuttonid");
	setdeck1Cbuttonelem = select("#setdeck1Cbuttonid");
	setdeck1Dbuttonelem = select("#setdeck1Dbuttonid");
	setdeck1allbuttonelem = select("#setdeck1allbuttonid");
	showdeckbuttonsbuttonelem = select("#showdeckbuttonsbuttonid");
	hidedeckbuttonsbuttonelem = select("#hidedeckbuttonsbuttonid");
	// Matching event triggers to function calls.
	startbuttonelem.mouseClicked(startbuttonpressed); // Start button event.
	answerboxelem.input(inputchar); // Every time a character is input to the answer box, call the function for the display to live-update.
	answerboxelem.changed(inputsubmitted); // Event to call game-enginey things when an answer is submitted.
	dark1colorbuttonelem.mouseClicked(dark1colorbuttonpressed); // Dark 1 color scheme button event.
	dark2colorbuttonelem.mouseClicked(dark2colorbuttonpressed); // Dark 2 color scheme button event.
	semidarkcolorbuttonelem.mouseClicked(semidarkcolorbuttonpressed); // Semi dark color scheme button event.
	lightcolorbuttonelem.mouseClicked(lightcolorbuttonpressed); // Light color scheme button event.
	showcolorbuttonsbuttonelem.mouseClicked(showcolorbuttons); // Show color schemes buttons button event.
	hidecolorbuttonsbuttonelem.mouseClicked(hidecolorbuttons); // Hide color schemes buttons button event.
	setgamemodembuttonelem.mouseClicked(setgamemodem); // Set game mode to minimal example button event.
	setgamemodedbuttonelem.mouseClicked(setgamemoded); // Set game mode to description button event.
	setgamemodebbuttonelem.mouseClicked(setgamemodeb); // Set game mode to both example and description button event.
	showgamemodebuttonsbuttonelem.mouseClicked(showgamemodebuttons); // Show game mode buttons button event.
	hidegamemodebuttonsbuttonelem.mouseClicked(hidegamemodebuttons); // Hide game mode buttons button event.
	setdeck1Abuttonelem.mouseClicked(setdeck1A); // Set the deck to Prelude vocab level 1A button event.
	setdeck1Bbuttonelem.mouseClicked(setdeck1B); // Set the deck to Prelude vocab level 1B button event.
	setdeck1Cbuttonelem.mouseClicked(setdeck1C); // Set the deck to Prelude vocab level 1C button event.
	setdeck1Dbuttonelem.mouseClicked(setdeck1D); // Set the deck to Prelude vocab level 1D button event.
	setdeck1allbuttonelem.mouseClicked(setdeck1all); // Set the deck to Prelude vocab level 1-all button event.
	showdeckbuttonsbuttonelem.mouseClicked(showdeckbuttons); // Show the deck choice buttons button event.
	hidedeckbuttonsbuttonelem.mouseClicked(hidedeckbuttons); // Hide the deck choice buttons button event.
	// Hide most of the things on startup (they appear after the 'start button' button is pressed).
	document.getElementById("questiontitle1id").style.display = "none";
	document.getElementById("questiontitle2id").style.display = "none";
	document.getElementById("terminallabelid").style.display = "none";
	document.getElementById("terminaltextid").style.display = "none";
	document.getElementById("answerdivid").style.display = "none";
	document.getElementById("scoretextid").style.display = "none";
	document.getElementById("messagelabelid").style.display = "none";
	document.getElementById("messagetextid").style.display = "none";
  	document.getElementById("dark1colorbuttonid").style.display = "none";
  	document.getElementById("dark2colorbuttonid").style.display = "none";
  	document.getElementById("semidarkcolorbuttonid").style.display = "none";
  	document.getElementById("lightcolorbuttonid").style.display = "none";
  	document.getElementById("showcolorbuttonsbuttonid").style.display = "none";
  	document.getElementById("hidecolorbuttonsbuttonid").style.display = "none";
  	document.getElementById("setgamemodembuttonid").style.display = "none";
  	document.getElementById("setgamemodedbuttonid").style.display = "none";
  	document.getElementById("setgamemodebbuttonid").style.display = "none";
  	document.getElementById("showgamemodebuttonsbuttonid").style.display = "none";
  	document.getElementById("hidegamemodebuttonsbuttonid").style.display = "none";
  	document.getElementById("setdeck1Abuttonid").style.display = "none";
  	document.getElementById("setdeck1Bbuttonid").style.display = "none";
  	document.getElementById("setdeck1Cbuttonid").style.display = "none";
  	document.getElementById("setdeck1Dbuttonid").style.display = "none";
  	document.getElementById("setdeck1allbuttonid").style.display = "none";
  	document.getElementById("showdeckbuttonsbuttonid").style.display = "none";
  	document.getElementById("hidedeckbuttonsbuttonid").style.display = "none";
	// Start with focus on start button so you can press enter to press the start button right after loading the page.
	document.getElementById("startbuttonid").focus();
}

function startbuttonpressed() {
	// (After start button is pressed) Hide the start button and show most of the things.
	document.getElementById("startbuttonid").style.display = "none";
	document.getElementById("questiontitle1id").style.display = "block";
	document.getElementById("questiontitle2id").style.display = "block";
	document.getElementById("terminallabelid").style.display = "block";
	document.getElementById("terminaltextid").style.display = "block";
	document.getElementById("answerdivid").style.display = "block";
	document.getElementById("scoretextid").style.display = "block";
	document.getElementById("messagelabelid").style.display = "block";
	document.getElementById("messagetextid").style.display = "block";
  	document.getElementById("showcolorbuttonsbuttonid").style.display = "block";
  	document.getElementById("showgamemodebuttonsbuttonid").style.display = "block";
  	document.getElementById("showdeckbuttonsbuttonid").style.display = "block";
	// Set initial color scheme to dark.
	semidarkcolorbuttonpressed();
	// Pick a new question and display it (calling the same function that's called after a right answer).
	pickandshownewquestion();
	showcolorbuttons();
	showgamemodebuttons();
	showdeckbuttons();
	setdeck1B();
	setgamemodeb();
	messagetextelem.html(".");
	// Apply colors - without this all the onscreen text appears in one color.
	applycolors();
}

function inputchar() {
	if (gameisover === 0) {
		// When a character is input, live update the terminal box contents.
		switch (gamemode) {
			case "minex":
				terminaltextelem.html(currentquestioncard.gettextforminexmode().replace(/->ANSWER<-/g,answerboxelem.value()));
				break;
			case "desc":
				break;
			case "minexanddesc":
				terminaltextelem.html(currentquestioncard.gettextforminexanddescmode().replace(/->ANSWER<-/g,answerboxelem.value()));
				break;
			default:
				terminaltextelem.html("error: invalid gamemode");
		}
	} else {
		terminaltextelem.html("Hooray!!  " + answerboxelem.value()); // Easter egg.  When you get the win message in the terminal and the message box, if you keep typing, "Hooray!! " will appear before your input in the terminal box.
	}
	// Apply colors - without this all the onscreen text appears in one color.
	applycolors();
}

function inputsubmitted() {
	// This function is called when an answer is submitted.
	if (gameisover === 0) {
		// If the game is still on,
		if (answerboxelem.value() === answer) {
			// If the answer is right,
			// Increment the score.
			score++;
			// Put 'right answer' message on the message text.
			messagetextelem.html("Your answer of " + answerboxelem.value() + " was right.  +1 point.");
		} else {
			// If the answer is wrong
			// Decrement the score.
			score -= 5;
			// Put 'wrong answer' message on the message text.
			messagetextelem.html("Your answer of " + answerboxelem.value() + " was wrong.  Lost 5 points.  The right answer for that one was " + currentquestioncard.answer);
		}
		// Update the score display.
		scoretextelem.html("Your score: " + score + ".");
		// Pick a new question and show it.
		pickandshownewquestion();
		// Apply colors - without this all the onscreen text appears in one color.
		applycolors();
		// Clear the answer box.
		answerboxelem.value("");
	}
	if (score >= gamewinningscore) {
		// If the score qualifies for winning,
		// Set the gameisover to 1.
		gameisover = 1;
	}
	if (gameisover === 1 ) {
		// If the game is over, display win messages.
		terminaltextelem.html("You won the game by getting to 50 points.");
		messagetextelem.html("You won the game by getting to 50 points.");
	}
}

function pickandshownewquestion() {
	// After an answer or after pressing the 'start button' button, do the following things to pick a new question and show it.
	// The current deck is a list of lists (subdecks).  The length current deck is how many subdecks it contains.
	// The card picking process will pick a random subdeck with equal chance for any subdeck, and then pick a random card from that deck.
	// This randomization process with 2 dice rolls means each vocab word is equally likely even if there are different quantities of cards for different words.
	// Roll the dice to pick a subdeck from the number of subdecks in the current deck.
	vocabwordnum = Math.floor(Math.random() * currentdeck.length);
	// Pick the subdeck from the deck using that first dice roll.
	currentsubdeck = currentdeck[vocabwordnum];
	// Roll the dice to pick from the cards of the chosen subdeck.
	indexinsubdeck = Math.floor(Math.random() * currentsubdeck.length);
	// Pick the question card from the current subdeck using that second dice roll.
	currentquestioncard = currentsubdeck[indexinsubdeck]
	// Display text to terminal based on the current card and the game mode.
	switch (gamemode) {
		case "minex":
			terminaltextelem.html(currentquestioncard.gettextforminexmode());
			break;
		case "desc":
			terminaltextelem.html(currentquestioncard.gettextfordescmode());
			break;
		case "minexanddesc":
			terminaltextelem.html(currentquestioncard.gettextforminexanddescmode());
			break;
		default:
			terminaltextelem.html("error: invalid gamemode");
	}
	// Set the global answer variable to the answer from the newly selected card.  When an answer is submitted by the user, it will be checked to see if it matches this answer.
	answer = currentquestioncard.answer;
	// Clear the input text box and set focus to it so you can type an answer after pressing the start button or mode buttons without having to click on the text box.
	document.getElementById("answerboxid").value = "";
	document.getElementById("answerboxid").focus();

}

function applycolors () {
	// Apply the colors in the color variables to the displayed things.
	// This often needs to be called in order for the colors to show up.
	// Set background colors of the "terminal" and message divs
	document.getElementById("terminaltextdivid").style.backgroundColor = "rgb(" + termBG.R + "," + termBG.G + "," + termBG.B + ")";
	document.getElementById("messagetextdivid").style.backgroundColor = "rgb(" + termBG.R + "," + termBG.G + "," + termBG.B + ")";
	// Set the default foreground colors for things that don't have HTML color tags?
	document.getElementById("terminaltextid").style.color = "rgb(" + termFG01.R + "," + termFG01.G + "," + termFG01.B + ")";
	document.getElementById("messagetextid").style.color = "rgb(" + termFG01.R + "," + termFG01.G + "," + termFG01.B + ")";
	// Find things with color 1 tag, set each to color 1 of current color scheme, then for color 2 tags and color 2, etc.
	var colorfg01thingelemlist = document.getElementsByClassName("colorfg01things");
	for (var i = 0; i < colorfg01thingelemlist.length; i++) {
            var indexedelem = colorfg01thingelemlist[i];
                indexedelem.style.color = "rgb(" + termFG01.R + "," + termFG01.G + "," + termFG01.B + ")";
        }
	var colorfg02thingelemlist = document.getElementsByClassName("colorfg02things");
	for (var i = 0; i < colorfg02thingelemlist.length; i++) {
            var indexedelem = colorfg02thingelemlist[i];
                indexedelem.style.color = "rgb(" + termFG02.R + "," + termFG02.G + "," + termFG02.B + ")";
        }
	var colorfg03thingelemlist = document.getElementsByClassName("colorfg03things");
	for (var i = 0; i < colorfg03thingelemlist.length; i++) {
            var indexedelem = colorfg03thingelemlist[i];
                indexedelem.style.color = "rgb(" + termFG03.R + "," + termFG03.G + "," + termFG03.B + ")";
        }
	var colorfg04thingelemlist = document.getElementsByClassName("colorfg04things");
	for (var i = 0; i < colorfg04thingelemlist.length; i++) {
            var indexedelem = colorfg04thingelemlist[i];
                indexedelem.style.color = "rgb(" + termFG04.R + "," + termFG04.G + "," + termFG04.B + ")";
        }
	var colorfg05thingelemlist = document.getElementsByClassName("colorfg05things");
	for (var i = 0; i < colorfg05thingelemlist.length; i++) {
            var indexedelem = colorfg05thingelemlist[i];
                indexedelem.style.color = "rgb(" + termFG05.R + "," + termFG05.G + "," + termFG05.B + ")";
        } 
	var colorfg06thingelemlist = document.getElementsByClassName("colorfg06things");
	for (var i = 0; i < colorfg06thingelemlist.length; i++) {
            var indexedelem = colorfg06thingelemlist[i];
                indexedelem.style.color = "rgb(" + termFG06.R + "," + termFG06.G + "," + termFG06.B + ")";
        } 
}

function restartgame() {
	gameisover = 0;
	questiontitle1elem.html(currentgamemodedescription + " | " + currentdeckdescription);
	pickandshownewquestion();
	score = 0;
	scoretextelem.html("Your score: " + score + ".");
	applycolors();
}

// When the button for "show color scheme buttons" is clicked, the color scheme picker buttons are shown, show button is hid, hide button is shown.
function showcolorbuttons() {
	document.getElementById("dark1colorbuttonid").style.display = "block";
	document.getElementById("dark2colorbuttonid").style.display = "block";
	document.getElementById("semidarkcolorbuttonid").style.display = "block";
	document.getElementById("lightcolorbuttonid").style.display = "block";
  	document.getElementById("showcolorbuttonsbuttonid").style.display = "none";
  	document.getElementById("hidecolorbuttonsbuttonid").style.display = "block";
}

// When the button for "hide color scheme buttons" is clicked, the color scheme picker buttons are hidden, show button is shown, hide button is hid.
function hidecolorbuttons() {
	document.getElementById("dark1colorbuttonid").style.display = "none";
	document.getElementById("dark2colorbuttonid").style.display = "none";
	document.getElementById("semidarkcolorbuttonid").style.display = "none";
	document.getElementById("lightcolorbuttonid").style.display = "none";
  	document.getElementById("showcolorbuttonsbuttonid").style.display = "block";
  	document.getElementById("hidecolorbuttonsbuttonid").style.display = "none";
}

// When the button for "show game mode buttons" is clicked, the game mode picker buttons are shown, show button is hid, hide button is shown.
function showgamemodebuttons() {
	document.getElementById("setgamemodembuttonid").style.display = "block";
	document.getElementById("setgamemodedbuttonid").style.display = "block";
	document.getElementById("setgamemodebbuttonid").style.display = "block";
	document.getElementById("showgamemodebuttonsbuttonid").style.display = "none";
  	document.getElementById("hidegamemodebuttonsbuttonid").style.display = "block";
}

// When the button for "hide game mode buttons" is clicked, the game mode picker buttons are hidden, show button is shown, hide button is hid.
function hidegamemodebuttons() {
	document.getElementById("setgamemodembuttonid").style.display = "none";
	document.getElementById("setgamemodedbuttonid").style.display = "none";
	document.getElementById("setgamemodebbuttonid").style.display = "none";
	document.getElementById("showgamemodebuttonsbuttonid").style.display = "block";
  	document.getElementById("hidegamemodebuttonsbuttonid").style.display = "none";
}

// When the button for "show vocab level buttons" is clicked, the vocab level picker buttons are shown, show button is hid, hide button is shown.
function showdeckbuttons() {
	document.getElementById("setdeck1Abuttonid").style.display = "block";
	document.getElementById("setdeck1Bbuttonid").style.display = "block";
	document.getElementById("setdeck1Cbuttonid").style.display = "block";
	document.getElementById("setdeck1Dbuttonid").style.display = "block";
	document.getElementById("setdeck1allbuttonid").style.display = "block";
	document.getElementById("showdeckbuttonsbuttonid").style.display = "none";
  	document.getElementById("hidedeckbuttonsbuttonid").style.display = "block";
}

// When the button for "hide vocab level buttons" is clicked, the vocab level picker buttons are hidden, show button is shown, hide button is hid.
function hidedeckbuttons() {
	document.getElementById("setdeck1Abuttonid").style.display = "none";
	document.getElementById("setdeck1Bbuttonid").style.display = "none";
	document.getElementById("setdeck1Cbuttonid").style.display = "none";
	document.getElementById("setdeck1Dbuttonid").style.display = "none";
	document.getElementById("setdeck1allbuttonid").style.display = "none";
	document.getElementById("showdeckbuttonsbuttonid").style.display = "block";
  	document.getElementById("hidedeckbuttonsbuttonid").style.display = "none";
}

// When the button to choose vocab level 1A button is pressed, change the deck, change a few display messages, restart game.
function setdeck1A() {
	currentdeck = Q1Aall;
	currentdeckdescription = "Prelude vocab level 1A"
	messagetextelem.html("Changed vocab level to 1A.");
	restartgame();
}

// When the button to choose vocab level 1B button is pressed, change the deck, change a few display messages, restart game.
function setdeck1B() {
	currentdeck = Q1Ball;
	currentdeckdescription = "Prelude vocab level 1B"
	messagetextelem.html("Changed vocab level to 1B.");
	restartgame();
}

// When the button to choose vocab level 1C button is pressed, change the deck, change a few display messages, restart game.
function setdeck1C() {
	currentdeck = Q1Call;
	currentdeckdescription = "Prelude vocab level 1C"
	messagetextelem.html("Changed vocab level to 1C.");
	restartgame();
}

// When the button to choose vocab level 1D button is pressed, change the deck, change a few display messages, restart game.
function setdeck1D() {
	currentdeck = Q1Dall;
	currentdeckdescription = "Prelude vocab level 1D"
	messagetextelem.html("Changed vocab level to 1D.");
	restartgame();
}

// When the button to choose vocab level 1-all button is pressed, change the deck, change a few display messages, restart game.
function setdeck1all() {
	currentdeck = Q1Aall.concat(Q1Ball,Q1Call,Q1Dall);
	currentdeckdescription = "Prelude vocab level 1-all"
	messagetextelem.html("Changed vocab level to 1-all.");
	restartgame();
}

// When the button for setting the game mode to "Name that function: from minimal example" is pressed, change the game mode, change a few display messages, restart game.
function setgamemodem() {
	if (gamemode != "minex") {
		gamemode = "minex";
		currentgamemodedescription = "Name that function: from minimal example"
		document.getElementById("questiontitle2id").style.display = "block";
		terminallabelelem.html("Terminal running GHCi");
		messagetextelem.html("Changed game mode to \"Name that function - from minimal example\".");
		restartgame();
	}
}

// When the button for setting the game mode to "Name that function: from description" is pressed, change the game mode, change a few display messages, restart game.
function setgamemoded() {
	if (gamemode != "desc") {
		gamemode = "desc";
		currentgamemodedescription = "Name that function: from description"
		document.getElementById("questiontitle2id").style.display = "none";
		terminallabelelem.html("Description:");
		messagetextelem.html("Changed game mode to \"Name that function - from description\".");
		restartgame();
	}
}

// When the button for setting the game mode to "Name that function: from description and minimal example" is pressed, change the game mode, change a few display messages, restart game.
function setgamemodeb() {
	if (gamemode != "minexanddesc") {
		gamemode = "minexanddesc";
		currentgamemodedescription = "Name that function: from description and minimal example"
		document.getElementById("questiontitle2id").style.display = "block";
		terminallabelelem.html("Terminal running GHCi");
		messagetextelem.html("Changed game mode to \"Name that function - from description and minimal example\".");
		restartgame();
	}
}

// When the button for color scheme dark 1 is pressed, set and apply colors for color scheme dark 1.
function dark1colorbuttonpressed() {
	termBG = new colorRGB(0,0,0);
	termFG01 = new colorRGB(255,255,255);
	termFG02 = new colorRGB(0,255,255);
	termFG03 = new colorRGB(45,212,45);
	termFG04 = new colorRGB(255,0,165);
	termFG05 = new colorRGB(152,0,255);
	termFG06 = new colorRGB(255,0,0);
	applycolors();
}

// When the button for color scheme dark 2 is pressed, set and apply colors for color scheme dark 2.
function dark2colorbuttonpressed() {
	termBG = new colorRGB(0,0,0);
	termFG01 = new colorRGB(255,255,255);
	termFG02 = new colorRGB(134,228,228);
	termFG03 = new colorRGB(151,212,151);
	termFG04 = new colorRGB(228,134,195);
	termFG05 = new colorRGB(190,134,228);
	termFG06 = new colorRGB(228,134,134);
	applycolors();
}

// When the button for color scheme semi-dark is pressed, set and apply colors for color scheme semi-dark.
function semidarkcolorbuttonpressed() {
	termBG = new colorRGB(50,46,66);
	termFG01 = new colorRGB(255,255,255);
	termFG02 = new colorRGB(38,181,255);
	termFG03 = new colorRGB(223,126,102);
	termFG04 = new colorRGB(242,255,102);
	termFG05 = new colorRGB(33,255,165);
	termFG06 = new colorRGB(255,99,153);
	applycolors();
}

// When the button for color scheme light is pressed, set and apply colors for color scheme light.
function lightcolorbuttonpressed() {
	termBG = new colorRGB(229,220,186);
	termFG01 = new colorRGB(0,17,40);
	termFG02 = new colorRGB(22,55,125);
	termFG03 = new colorRGB(145,41,0);
	termFG04 = new colorRGB(115,54,150);
	termFG05 = new colorRGB(49,135,63);
	termFG06 = new colorRGB(188,0,94);
	applycolors();
}
