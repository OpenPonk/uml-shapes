Class {
	#name : #OPUmlEdgeTest,
	#superclass : #OPDITestCase,
	#category : #'OpenPonk-UML-DI-Tests'
}

{ #category : #accessing }
OPUmlEdgeTest >> elementClass [
	^ OPUmlEdge
]

{ #category : #running }
OPUmlEdgeTest >> setUp [
	| source target |
	super setUp.
	source := OPUmlLabel new.
	target := OPUmlLabel new.
	element source: source.
	element target: target
]

{ #category : #tests }
OPUmlEdgeTest >> testRemove [
	| lbl |
	(lbl := OPUmlLabel new) owningElement: element.
	self assert: element ownedElements asArray equals: {lbl}.
	lbl owningElement: nil.
	self assert: element ownedElements isEmpty
]

{ #category : #tests }
OPUmlEdgeTest >> testRemoveDetachFromEnds [
	| source target  |
	source := OPUmlLabel new.
	target := OPUmlLabel new.
	element source: source.
	element target: target.
	element remove.
	self assert: source sourceEdges asArray equals: #().
	self assert: target targetEdges asArray equals: #()
]

{ #category : #tests }
OPUmlEdgeTest >> testRemoveFromView [

	| lbl v |
	(lbl := OPUmlLabel new) owningElement: element.
	v := RTView new.
	element renderIn: v.
	lbl renderIn: v.
	self assert: v geomEdges size equals: 1.
	self assert: v elements size equals: 1.
	element remove.
	self assert: v geomEdges size equals: 0.
	self assert: v elements size equals: 0
]
