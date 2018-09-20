Class {
	#name : #OPUmlDiagramElement,
	#superclass : #OPDIDiagramElement,
	#instVars : [
		'isIcon',
		'owningElement',
		'ownedElements',
		'modelElement',
		'sourceEdges',
		'targetEdges'
	],
	#category : 'OpenPonk-UML-DI-UML'
}

{ #category : #initialization }
OPUmlDiagramElement >> initialize [
	super initialize.
	isIcon := false.
	localStyle := nil.
	sharedStyle := nil.
	ownedElements := SRToManyLink on: self slot: #ownedElements oppositeSlot: #owningElement.
	owningElement := nil.
	modelElement := nil.
	self flag: 'This looks strange'.
	sourceEdges := SRToManyLink on: self slot: #sourceEdges oppositeSlot: #source.
	targetEdges := SRToManyLink on: self slot: #targetEdges oppositeSlot: #target.
]

{ #category : #accessing }
OPUmlDiagramElement >> modelElement [
	^ modelElement
]

{ #category : #accessing }
OPUmlDiagramElement >> modelElement: anObject [
	modelElement := anObject
]

{ #category : #accessing }
OPUmlDiagramElement >> ownedElements [
	<DCType: #OPUmlDiagramElement opposite: #owningElement multiplicity: #(#*)>
	^ ownedElements
]

{ #category : #accessing }
OPUmlDiagramElement >> ownedElements: aCollection [
	ownedElements
		removeAll;
		addAll: aCollection
]

{ #category : #accessing }
OPUmlDiagramElement >> owningElement [
	<DCType: #OPUmlDiagramElement opposite: #ownedElements multiplicity: #(0 1)>
	^ owningElement
]

{ #category : #accessing }
OPUmlDiagramElement >> owningElement: aDiagramElement [
	owningElement := SRToOneLink
		on: self
		slot: #owningElement
		oppositeSlot: #ownedElements
		updateFrom: owningElement
		to: aDiagramElement
]

{ #category : #accessing }
OPUmlDiagramElement >> sourceEdges [
	^ sourceEdges
]

{ #category : #accessing }
OPUmlDiagramElement >> sourceEdges: aCollection [
	sourceEdges
		removeAll;
		addAll: aCollection
]

{ #category : #accessing }
OPUmlDiagramElement >> targetEdges [
	^ targetEdges
]

{ #category : #accessing }
OPUmlDiagramElement >> targetEdges: aCollection [
	targetEdges
		removeAll;
		addAll: aCollection
]
