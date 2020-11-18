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
		and: [ comments anySatisfy: [ :any | any body isNotEmpty ] ]
]

{ #category : #initialization }
OPUmlClassifierShape >> initialize [
	super initialize.
	commentIcon := OPUmlIcon new.
	commentIcon display: [ self hasComments ].
	commentIcon form: (self iconNamed: #announcement).
	commentIcon localStyle: OPUmlStyle new.
	commentIcon owningElement: self
]

{ #category : #'Roassal2 - updating' }
OPUmlClassifierShape >> layout [
	super layout.
	commentIcon
		translateTo:
			self rtElement encompassingRectangle bottomRight
				- (commentIcon rtElement extent / 2) - (2 @ 2)
]

{ #category : #'Roassal2 - updating' }
OPUmlClassifierShape >> update [
	commentIcon update.
	super update
]
