Class {
	#name : #OPUmlIcon,
	#superclass : #OPUmlShape,
	#instVars : [
		'form',
		'displayBlock',
		'view'
	],
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #'Roassal2 - manipulation' }
OPUmlIcon >> createRtElement [
	^ RTBitmap new
		form: self form;
		extent: 32@32"self form extent";
		elementOn: self
]

{ #category : #accessing }
OPUmlIcon >> display: aBlock [
	displayBlock := aBlock
]

{ #category : #accessing }
OPUmlIcon >> form [
	^ form
]

{ #category : #accessing }
OPUmlIcon >> form: aForm [
	form := aForm
]

{ #category : #initialization }
OPUmlIcon >> initialize [
	super initialize.
	isIcon := true
]

{ #category : #removing }
OPUmlIcon >> remove [
	self rtElement remove
]

{ #category : #rendering }
OPUmlIcon >> renderIn: aView [
	view ifNotNil: [ ^ self ].
	view := aView
]

{ #category : #'Roassal2 - updating' }
OPUmlIcon >> update [
	| shouldBeDisplayed |
	shouldBeDisplayed := displayBlock value.
	self view isNil & shouldBeDisplayed
		ifTrue: [ ^ view add: self rtElement ].
	self view isNotNil & shouldBeDisplayed not
		ifTrue: [ ^ self rtElement remove ]
]
