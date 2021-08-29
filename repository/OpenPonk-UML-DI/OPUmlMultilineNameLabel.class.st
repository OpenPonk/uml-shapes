Class {
	#name : #OPUmlMultilineNameLabel,
	#superclass : #OPUmlNameLabel,
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #'Roassal2 - manipulation' }
OPUmlMultilineNameLabel >> createRtElement [
	^ OPRTStyledMultilineLabel new
		fontSize: #fontSize;
		color: #fontColor;
		text: #text;
		emphasis: #emphasis;
		elementOn: self
]
