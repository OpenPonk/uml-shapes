Class {
	#name : #OPRTUmlEdgeHighlighterTest,
	#superclass : #OPRTHighlighterTest,
	#instVars : [
		'edge'
	],
	#category : 'OpenPonk-UML-DI-Roassal'
}

{ #category : #running }
OPRTUmlEdgeHighlighterTest >> setUp [
	super setUp.
	highlighter := OPRTUmlEdgeHighlighter new
]

{ #category : #running }
OPRTUmlEdgeHighlighterTest >> setUpModel [
	| end |
	end := OPUmlLabel new.
	end := OPUmlLabel new.
	(edge := OPUmlEdge new)
		in: [ :e | e localStyle strokeColor: Color blue ];
		source: end;
		target: end.
	end renderIn: view.
	edge renderIn: view.
	model := edge rtEdge
]

{ #category : #tests }
OPRTUmlEdgeHighlighterTest >> testEdgeIsNotForUmlEdge [
	self deny: (OPRTEdgeHighlighter isFor: model)
]

{ #category : #tests }
OPRTUmlEdgeHighlighterTest >> testHighlight [
	self assert: (model shape colorFor: model) equals: Color blue.
	self assert: edge style strokeColor equals: Color blue.
	highlighter highlight: model color: Color red.
	self assert: (model shape colorFor: model) equals: Color red.
	self assert: edge style strokeColor equals: Color red.
	highlighter remove.
	self assert: (model shape colorFor: model) equals: Color blue.
	self assert: edge style strokeColor equals: Color blue
]

{ #category : #tests }
OPRTUmlEdgeHighlighterTest >> testReentrant [
	self assert: (model shape colorFor: model) equals: Color blue.
	self assert: edge style strokeColor equals: Color blue.
	highlighter highlight: model color: Color red.
	self assert: (model shape colorFor: model) equals: Color red.
	self assert: edge style strokeColor equals: Color red.
	highlighter highlight: model color: Color yellow.
	self assert: (model shape colorFor: model) equals: Color red.
	self assert: edge style strokeColor equals: Color red.
	highlighter remove.
	self assert: (model shape colorFor: model) equals: Color blue.
	self assert: edge style strokeColor equals: Color blue
]
