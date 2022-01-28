var cardtypex01 = function(inpdesc,inpminext,inpans) {
	this.desc = inpdesc;
	this.minextext = inpminext;
	this.answer = inpans;
}

cardtypex01.prototype.gettextforminexmode = function () {return expandtags(this.minextext)}

cardtypex01.prototype.gettextfordescmode = function () {return ("<span class=\"colorfg02things\">" + this.desc + "</span>")}

cardtypex01.prototype.gettextforminexanddescmode = function () {return ("<span class=\"colorfg01things\">Prelude> </span><span class=\"colorfg03things\">-- " + this.desc + "</span><br>" + expandtags(this.minextext))}

expandtags = function (inpstring) {
	return inpstring.replace(/<01>/g,"<span class=\"colorfg01things\">").replace(/<02>/g,"<span class=\"colorfg02things\">").replace(/<03>/g,"<span class=\"colorfg03things\">").replace(/<04>/g,"<span class=\"colorfg04things\">").replace(/<05>/g,"<span class=\"colorfg05things\">").replace(/<06>/g,"<span class=\"colorfg06things\">")
}
