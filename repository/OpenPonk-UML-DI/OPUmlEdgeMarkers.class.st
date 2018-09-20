Class {
	#name : #OPUmlEdgeMarkers,
	#superclass : #Object,
	#classInstVars : [
		'current'
	],
	#category : 'OpenPonk-UML-DI-Facades'
}

{ #category : #markers }
OPUmlEdgeMarkers class >> arrow [
	^ self current arrow
]

{ #category : #meta }
OPUmlEdgeMarkers class >> compileDelegatorFor: aMethod [
	(self class selectors includes: aMethod selector)
		ifTrue: [ ^ self ].
	self class
		compile:
			('{1}
	^ self current {1}' format: {aMethod sourceCode lines first})
		classified: 'markers'
]

{ #category : #accessing }
OPUmlEdgeMarkers class >> current [
	^ current ifNil: [ current := self new ]
]

{ #category : #markers }
OPUmlEdgeMarkers class >> emptyCircle [
	^ self current emptyCircle
]

{ #category : #markers }
OPUmlEdgeMarkers class >> emptyDiamond [
	^ self current emptyDiamond
]

{ #category : #markers }
OPUmlEdgeMarkers class >> emptyDiamondWith: aString [
	^ self current emptyDiamondWith: aString
]

{ #category : #markers }
OPUmlEdgeMarkers class >> filledArrow [
	^ self current filledArrow
]

{ #category : #markers }
OPUmlEdgeMarkers class >> filledCircle [
	^ self current filledCircle
]

{ #category : #markers }
OPUmlEdgeMarkers class >> filledDiamond [
	^ self current filledDiamond
]

{ #category : #markers }
OPUmlEdgeMarkers class >> filledDiamondWith: aString [
	^ self current filledDiamondWith: aString
]

{ #category : #markers }
OPUmlEdgeMarkers class >> none [
	^ self current none
]

{ #category : #markers }
OPUmlEdgeMarkers class >> simpleArrow [
	^ self current simpleArrow
]

{ #category : #meta }
OPUmlEdgeMarkers class >> updateShortcutMethods [
	<script>
	(self methodsInProtocol: 'markers') do: [ :each | self compileDelegatorFor: each ]
]

{ #category : #markers }
OPUmlEdgeMarkers class >> wideArrow [
	^ self current wideArrow
]

{ #category : #markers }
OPUmlEdgeMarkers >> arrow [
	^ RTEmptyNarrowArrow
]

{ #category : #markers }
OPUmlEdgeMarkers >> emptyCircle [
	^ RTEmptyCircle
]

{ #category : #markers }
OPUmlEdgeMarkers >> emptyDiamond [
	^ OPRTTextDiamondMarker empty
]

{ #category : #markers }
OPUmlEdgeMarkers >> emptyDiamondWith: aString [
	^ OPRTTextDiamondMarker emptyWith: aString
]

{ #category : #markers }
OPUmlEdgeMarkers >> filledArrow [
	^ RTFilledNarrowArrow
]

{ #category : #markers }
OPUmlEdgeMarkers >> filledCircle [
	^ RTFilledCircle
]

{ #category : #markers }
OPUmlEdgeMarkers >> filledDiamond [
	^ OPRTTextDiamondMarker filled
]

{ #category : #markers }
OPUmlEdgeMarkers >> filledDiamondWith: aString [
	^ OPRTTextDiamondMarker with: aString
]

{ #category : #markers }
OPUmlEdgeMarkers >> none [
	^ RTNoDecorationShape
]

{ #category : #markers }
OPUmlEdgeMarkers >> simpleArrow [
	^ RTSimpleArrow
]

{ #category : #markers }
OPUmlEdgeMarkers >> wideArrow [
	^ RTEmptyArrow
]
