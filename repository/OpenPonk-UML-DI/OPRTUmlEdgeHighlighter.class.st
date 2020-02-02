Class {
	#name : #OPRTUmlEdgeHighlighter,
	#superclass : #OPRTHighlighter,
	#category : 'OpenPonk-UML-DI-Roassal'
}

{ #category : #'instance creation' }
OPRTUmlEdgeHighlighter class >> highlight: anElement color: aColor [
	^ self new highlight: anElement color: aColor
]

{ #category : #testing }
OPRTUmlEdgeHighlighter class >> isFor: anElement [
	^ anElement isEdge and: [ anElement model isKindOf: OPUmlEdge ]
]

{ #category : #protocol }
OPRTUmlEdgeHighlighter >> highlight: anEdge color: aColor [
	self hasStore
		ifTrue: [ ^ self ].
	model := anEdge.
	self store: model model style strokeColor.
	model model style strokeColor: aColor.
	model model update
]

{ #category : #protocol }
OPRTUmlEdgeHighlighter >> remove [
	self hasStore
		ifFalse: [ ^ self ].
	model model style strokeColor: self load.
	self clearStore.
	model model update
]
