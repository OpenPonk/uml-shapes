Class {
	#name : #OPUmlCompartment,
	#superclass : #OPDiagramElement,
	#instVars : [
		'rtElement'
	],
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #accessing }
OPUmlCompartment >> compartmentedShape [
	^ self owningElement
]

{ #category : #'Roassal2 - drawing' }
OPUmlCompartment >> createRoassalShape [
	^ RTSVGPath new
		path: 'L 0 0';
		borderColor: self style strokeColor;
		borderWidth: (self style strokeWidth / 2) asFloat;
		elementOn: self
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartment >> remove [
	self rtElement remove
]

{ #category : #'Roassal2 - drawing' }
OPUmlCompartment >> rtElement [
	^ rtElement ifNil: [ rtElement := self createRoassalShape ]
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartment >> update [
	self owningElement update
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartment >> view [
	^ rtElement ifNil: [ nil ] ifNotNil: #view
]
