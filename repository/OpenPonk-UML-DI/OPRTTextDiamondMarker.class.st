Class {
	#name : #OPRTTextDiamondMarker,
	#superclass : #RTLineDecorationShape,
	#instVars : [
		'text',
		'fillColor'
	],
	#category : 'OpenPonk-UML-DI-Roassal'
}

{ #category : #'instance creation' }
OPRTTextDiamondMarker class >> empty [
	^ self emptyWith: ''
]

{ #category : #'instance creation' }
OPRTTextDiamondMarker class >> emptyWith: aString [
	^ self new
		fillColor: Color white;
		text: aString;
		yourself
]

{ #category : #'instance creation' }
OPRTTextDiamondMarker class >> filled [
	^ self with: ''
]

{ #category : #hooks }
OPRTTextDiamondMarker class >> trachelShapeClass [
	^	self filled trachelShapeClass
]

{ #category : #'instance creation' }
OPRTTextDiamondMarker class >> with: aString [
	^ self new
		fillColor: Color black;
		text: aString;
		yourself
]

{ #category : #comparing }
OPRTTextDiamondMarker >> = aMarker [
	self species = aMarker species
		ifFalse: [ ^ false ].
	fillColor = aMarker fillColor
		ifFalse: [ ^ false ].
	text = aMarker text
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #converting }
OPRTTextDiamondMarker >> asHead [
	^ RTLineHead shape: self
]

{ #category : #converting }
OPRTTextDiamondMarker >> asTail [
	^ RTLineTail shape: self
]

{ #category : #accessing }
OPRTTextDiamondMarker >> fillColor [
	^ fillColor
]

{ #category : #accessing }
OPRTTextDiamondMarker >> fillColor: aColor [
	fillColor := aColor
]

{ #category : #comparing }
OPRTTextDiamondMarker >> hash [
	^ (self hash bitXor: fillColor hash) bitXor: text hash
]

{ #category : #initialization }
OPRTTextDiamondMarker >> initialize [
	super initialize.
	text := ''
]

{ #category : #accessing }
OPRTTextDiamondMarker >> text [
	^ text
]

{ #category : #accessing }
OPRTTextDiamondMarker >> text: aString [
	text := aString
]

{ #category : #hooks }
OPRTTextDiamondMarker >> trachelShapeClass [
	^ OPTRTextDiamondMarkerShape new
		fillColor: fillColor;
		text: text;
		yourself
]
