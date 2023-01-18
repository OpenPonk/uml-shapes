Class {
	#name : #OPUmlClassifierShape,
	#superclass : #OPUmlCompartmentableShape,
	#instVars : [
		'commentIcon',
		'commentBlock'
	],
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #accessing }
OPUmlClassifierShape >> comments: aBlock [
	commentBlock := aBlock
]

{ #category : #testing }
OPUmlClassifierShape >> hasComments [
	| comments |
	comments := commentBlock value.
	^ comments isNotEmpty
		and: [ comments
				anySatisfy: [ :any | any body isNotNil and: [ any body isNotEmpty ] ] ]
]

{ #category : #initialization }
OPUmlClassifierShape >> initialize [
	super initialize.
	commentIcon := OPUmlIcon new.
	commentIcon display: [ self hasComments ].
	commentIcon form: (self iconNamed: #announcement).
	commentIcon localStyle: OPDIOpenPonkStyle new.
	commentIcon owningElement: self.
	commentBlock := #()
]

{ #category : #'Roassal2 - updating' }
OPUmlClassifierShape >> layout [

	super layout.
	self labels do: [ :each | 
		each translateTo:
			self encompassingRectangle center x @ each position y ].
	commentIcon translateTo:
		self rtElement encompassingRectangle bottomRight
		- (commentIcon rtElement extent / 2) - (2 @ 2)
]

{ #category : #'Roassal2 - updating' }
OPUmlClassifierShape >> update [
	commentIcon update.
	super update
]
