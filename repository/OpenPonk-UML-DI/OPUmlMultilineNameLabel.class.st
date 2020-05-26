Class {
	#name : #OPUmlMultilineNameLabel,
	#superclass : #OPUmlNameLabel,
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #'Roassal2 - manipulation' }
OPUmlMultilineNameLabel >> createRtElement [
	^ RTText new
		fontSize: #fontSize;
		color: #fontColor;
		text: #text;
		elementOn: self
]
