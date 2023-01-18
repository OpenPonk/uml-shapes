Class {
	#name : #OPUmlEdge,
	#superclass : #OPDIEdge,
	#instVars : [
		'rtEdge',
		'headDecorator',
		'tailDecorator',
		'view'
	],
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #'Roassal2 - updating' }
OPUmlEdge >> changed [
	self update
]

{ #category : #'Roassal2 - manipulation' }
OPUmlEdge >> createConnection [
	^ (OPRTStyledConnection new
		attachPoint: (OPRTOrthogonalAttachPoint new offset: 30);
		color: self style strokeColor;
		head: (self headDecorator asHead color: Color yellow);
		tail: self tailDecorator asTail;
		width: self style strokeWidth;
		edgeFrom: source rtElement to: target rtElement)
		@ OPRTConnectionHandles;
		model: self;
		yourself
]

{ #category : #'Roassal2 - manipulation' }
OPUmlEdge >> createLine [
	^ (RTStyledMultiLine new
		attachPoint: RTBorderAttachPoint new;
		head: self headDecorator asHead;
		tail: self tailDecorator asTail;
		color: self style strokeColor;
		width: self style strokeWidth;
		edgeFrom: source rtElement to: target rtElement)
		model: self;
		yourself

]

{ #category : #'Roassal2 - manipulation' }
OPUmlEdge >> createRtEdge [
	^ (Smalltalk hasClassNamed: #OPRTStyledConnection)
		ifTrue: [ self createConnection ]
		ifFalse: [ self createLine ]
]

{ #category : #'Roassal2 - accessing' }
OPUmlEdge >> headDecorator [
	^ headDecorator ifNil: [ headDecorator := OPUmlEdgeMarkers none ]
]

{ #category : #'Roassal2 - accessing' }
OPUmlEdge >> headDecorator: aDecorator [
	headDecorator := aDecorator.
	rtEdge ifNotNil: [ rtEdge shape head: (aDecorator asHead color: Color yellow) ]
]

{ #category : #initialization }
OPUmlEdge >> initialize [
	super initialize.
	source := nil.
	target := nil.
	waypoints := OrderedCollection new.
	(localStyle := OPDIOpenPonkStyle new)
		strokeColor: Color black;
		strokeWidth: 1
]

{ #category : #'Roassal2 - manipulation' }
OPUmlEdge >> remove [
	self source: nil.
	self target: nil.
	self view ifNil: [ ^ self ].
	(self ownedElements select: [ :each | each view isNotNil ])
		do: [ :each | 
			each
				owningElement: nil;
				remove ].
	[ self ownedElements notEmpty ]
		whileTrue: [ self ownedElements anyOne owningElement: nil ].
	self rtEdge view ifNotNil: [ self rtEdge remove ].
	view signalUpdate.
	view := nil
]

{ #category : #'Roassal2 - manipulation' }
OPUmlEdge >> renderIn: aView [
	view := aView.
	aView add: self rtEdge
]

{ #category : #'Roassal2 - accessing' }
OPUmlEdge >> rtEdge [
	^ rtEdge ifNil: [ rtEdge := self createRtEdge ]
]

{ #category : #accessing }
OPUmlEdge >> source [
	^ source
]

{ #category : #accessing }
OPUmlEdge >> source: aDiagramElement [
	source := SRToOneLink
		on: self
		slot: #source
		oppositeSlot: #sourceEdges
		updateFrom: source
		to: aDiagramElement
]

{ #category : #'Roassal2 - manipulation' }
OPUmlEdge >> switchSourceAndTarget [

	| originalSource originalFrom originalTo |
	originalSource := self source.
	self source: self target.
	self target: originalSource.
	originalFrom := rtEdge from.
	originalTo := rtEdge to.
	rtEdge to: RTElement new. "otherwise old to == new from and old to gets removed"
	rtEdge from: originalTo.
	rtEdge to: originalFrom
]

{ #category : #'Roassal2 - accessing' }
OPUmlEdge >> tailDecorator [
	^ tailDecorator ifNil: [ tailDecorator := OPUmlEdgeMarkers none ]
]

{ #category : #'Roassal2 - accessing' }
OPUmlEdge >> tailDecorator: aDecorator [
	tailDecorator := aDecorator.
	rtEdge ifNotNil: [ rtEdge shape tail: (aDecorator asTail) ]
]

{ #category : #accessing }
OPUmlEdge >> target [
	^ target
]

{ #category : #accessing }
OPUmlEdge >> target: aDiagramElement [
	target := SRToOneLink
		on: self
		slot: #target
		oppositeSlot: #targetEdges
		updateFrom: target
		to: aDiagramElement
]

{ #category : #'Roassal2 - updating' }
OPUmlEdge >> update [
	self rtEdge shape
		color: self style strokeColor;
		width: self style strokeWidth.
	self rtEdge update.
	self view ifNotNil: [ self view signalUpdate ]
]

{ #category : #'Roassal2 - accessing' }
OPUmlEdge >> view [
	^ view
]
