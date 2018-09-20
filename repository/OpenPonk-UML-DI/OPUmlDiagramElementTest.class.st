Class {
	#name : #OPUmlDiagramElementTest,
	#superclass : #OPDITestCase,
	#category : 'OpenPonk-UML-DI-Tests'
}

{ #category : #accessing }
OPUmlDiagramElementTest >> elementClass [
	^ OPUmlDiagramElement
]

{ #category : #tests }
OPUmlDiagramElementTest >> testAddEdge [
	| source target edge |
	source := self elementInstance.
	target := self elementInstance.
	edge := OPUmlEdge new.
	edge source: source.
	edge target: target.
	self assertCollection: source sourceEdges hasSameElements: {edge}.
	self assertCollection: target targetEdges hasSameElements: {edge}.
	self assert: source targetEdges isEmpty.
	self assert: target sourceEdges isEmpty.
	self assert: edge source equals: source.
	self assert: edge target equals: target
]

{ #category : #tests }
OPUmlDiagramElementTest >> testAddOwnedElement [
	| parent child |
	parent := self elementInstance.
	child := self elementInstance.
	child owningElement: parent.
	self assert: parent owningElement equals: nil.
	self assert: child owningElement equals: parent.
	self assertCollection: parent ownedElements hasSameElements: {child}.
	self assert: child ownedElements size equals: 0
]

{ #category : #tests }
OPUmlDiagramElementTest >> testAddSelfEdge [
	| edge |
	edge := OPUmlEdge new.
	edge source: element.
	edge target: element.
	self assert: element sourceEdges asArray equals: {edge}.
	self assert: element targetEdges asArray equals: {edge}.
	self assert: edge source equals: element.
	self assert: edge target equals: element
]

{ #category : #tests }
OPUmlDiagramElementTest >> testEmpty [
	self assert: element modelElement isNil.
	self assert: element owningElement isNil.
	self assert: element ownedElements isEmpty.
	self assert: element sourceEdges isEmpty.
	self assert: element targetEdges isEmpty
]
