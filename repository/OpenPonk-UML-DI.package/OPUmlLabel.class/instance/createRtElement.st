Roassal2 - manipulation
createRtElement
	^ RTStyledLabel new
		height: self style fontSize;
		color: #fontColor;
		text: #text;
		emphasis: #emphasis;
		elementOn: self