Class {
	#name : #OPUmlAssociationEdge,
	#superclass : #OPUmlEdge,
	#instVars : [
		'label',
		'sourceLabel',
		'sourceMultiplicity',
		'targetLabel',
		'targetMultiplicity',
		'constraints'
	],
	#category : 'OpenPonk-UML-DI-Facades'
}

{ #category : #configuration }
OPUmlAssociationEdge >> constraintLabel: aLabel at: aPosition side: aSide [
	| config anchor |
	config := Dictionary
		with: #source -> (Array with: 10 with: aSide * 10)
		with: #target -> (Array with: -10 with: aSide * 10)
		with: #middle -> (Array with: 0.5 with: 10).
	anchor := OPRTAnchorConstraint new.
	anchor
		element: aLabel rtElement;
		edge: self rtEdge;
		balance: (config at: aPosition) first;
		minDistance: (config at: aPosition) second;
		build
]

{ #category : #initialization }
OPUmlAssociationEdge >> initialize [
	super initialize.
	constraints := OrderedCollection new
]

{ #category : #accessing }
OPUmlAssociationEdge >> label [
	^ label
]

{ #category : #accessing }
OPUmlAssociationEdge >> label: aLabel [
	label := aLabel.
	aLabel owningElement: self.
	constraints add: [ self constraintLabel: label at: #middle ]
]

{ #category : #Roassal2 }
OPUmlAssociationEdge >> labels [
	^ {label.
	sourceLabel.
	sourceMultiplicity.
	targetLabel.
	targetMultiplicity}
]

{ #category : #Roassal2 }
OPUmlAssociationEdge >> renderIn: aView [
	super renderIn: aView.
	self labels do: [ :each | each ifNotNil: [ each renderIn: aView ] ].
	constraints do: #value
]

{ #category : #accessing }
OPUmlAssociationEdge >> sourceLabel [
	^ sourceLabel
]

{ #category : #accessing }
OPUmlAssociationEdge >> sourceLabel: aLabel [
	sourceLabel := aLabel.
	aLabel owningElement: self.
	constraints add: [ self constraintLabel: aLabel at: #source side: 1 ]
]

{ #category : #accessing }
OPUmlAssociationEdge >> sourceMultiplicity [
	^ sourceMultiplicity
]

{ #category : #accessing }
OPUmlAssociationEdge >> sourceMultiplicity: aLabel [
	sourceMultiplicity := aLabel.
	aLabel owningElement: self.
	constraints add: [ self constraintLabel: aLabel at: #source side: -1 ]
]

{ #category : #accessing }
OPUmlAssociationEdge >> targetLabel [
	^ targetLabel
]

{ #category : #accessing }
OPUmlAssociationEdge >> targetLabel: aLabel [
	targetLabel := aLabel.
	aLabel owningElement: self.
	constraints add: [ self constraintLabel: aLabel at: #target side: 1 ]
]

{ #category : #accessing }
OPUmlAssociationEdge >> targetMultiplicity [
	^ targetMultiplicity
]

{ #category : #accessing }
OPUmlAssociationEdge >> targetMultiplicity: aLabel [
	targetMultiplicity := aLabel.
	aLabel owningElement: self.
	constraints add: [ self constraintLabel: aLabel at: #target side: -1 ]
]
