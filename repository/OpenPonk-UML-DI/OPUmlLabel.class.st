Class {
	#name : #OPUmlLabel,
	#superclass : #OPUmlShape,
	#instVars : [
		'text',
		'emphasis'
	],
	#category : 'OpenPonk-UML-DI-UML'
}

{ #category : #accessing }
OPUmlLabel class >> priority [
	^ 3
]

{ #category : #'Roassal2 - updating' }
OPUmlLabel >> changed [
	self update.
	super changed
]

{ #category : #'Roassal2 - manipulation' }
OPUmlLabel >> createRtElement [
	^ RTStyledLabel new
		height: #fontSize;
		color: #fontColor;
		text: #text;
		emphasis: #emphasis;
		elementOn: self
]

{ #category : #'Roassal2 - accessing' }
OPUmlLabel >> emphasis [
	| emph |
	emphasis isBlock
		ifTrue: [ emphasis value: self modelElement value: self localStyle ].
	emph := Set new.
	self style fontBold
		ifTrue: [ emph add: TextEmphasis bold ].
	self style fontItalic
		ifTrue: [ emph add: TextEmphasis italic ].
	self style fontUnderline
		ifTrue: [ emph add: TextEmphasis underlined ].
	^ emph
]

{ #category : #'Roassal2 - accessing' }
OPUmlLabel >> emphasis: anEmphasisBlock [
	emphasis := anEmphasisBlock
]

{ #category : #'Roassal2 - accessing' }
OPUmlLabel >> fontColor [
	| fontColor |
	fontColor := self style fontColor.
	fontColor isBlock
		ifTrue: [ ^ fontColor cull: self modelElement ].
	^ fontColor
]

{ #category : #'Roassal2 - accessing' }
OPUmlLabel >> fontSize [
	^ self style fontSize
]

{ #category : #'as yet unclassified' }
OPUmlLabel >> initialize [
	super initialize.
	(sharedStyle := OPUmlStyle new)
		fontName: 'Source Sans Pro';
		fontSize: 10;
		fontColor: Color black;
		fontItalic: false;
		fontBold: false;
		fontUnderline: false;
		fontStrikeThrough: false
]

{ #category : #'Roassal2 - accessing' }
OPUmlLabel >> minWidth [
	^ self rtElement width
]

{ #category : #'Roassal2 - manipulation' }
OPUmlLabel >> remove [
	| view |
	self owningElement
		ifNotNil: [ :oldOwner | 
			self owningElement: nil.
			oldOwner update ].
	view := self rtElement view.
	view ifNil: [ ^ self ].
	self rtElement remove.
	view signalUpdate
]

{ #category : #'Roassal2 - manipulation' }
OPUmlLabel >> renderIn: aView [
	self rtElement view ifNotNil: [ ^ self ].
	aView add: self rtElement.
	aView signalUpdate
]

{ #category : #accessing }
OPUmlLabel >> text [
	(text isNil or: [ text isString and: [ text isSymbol not ] ])
		ifTrue: [ ^ text ].
	^ text value: self modelElement
]

{ #category : #accessing }
OPUmlLabel >> text: aString [
	text := aString
]

{ #category : #'Roassal2 - updating' }
OPUmlLabel >> update [
	self rtElement update.
	self view ifNotNil: [ self view signalUpdate ]
]
