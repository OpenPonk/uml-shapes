Class {
	#name : #OPUmlCompartmentableShape,
	#superclass : #OPUmlShape,
	#instVars : [
		'view',
		'separators',
		'oldExtent'
	],
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #'Roassal2 - accessing' }
OPUmlCompartmentableShape >> compartmentFigures [

	^ RTGroup withAll: (self compartments flatCollect: #ownedElements)
]

{ #category : #accessing }
OPUmlCompartmentableShape >> compartments [
	<DCType: #OPUmlCompartment opposite: #compartmentedShape multiplicity: #(#*)>
	^ self ownedElements select: [ :each | each isKindOf: OPUmlCompartment ]
]

{ #category : #'Roassal2 - manipulation' }
OPUmlCompartmentableShape >> createRtElement [
	^ RTBox new
		size: 0;
		color: [ :model | model style fillColor ];
		borderColor: self style strokeColor;
		borderWidth: self style strokeWidth;
		elementOn: self
]

{ #category : #'Roassal2 - accessing' }
OPUmlCompartmentableShape >> figures [

	^ RTGroup withAll: self labels , self compartmentFigures
]

{ #category : #'Roassal2 - manipulation' }
OPUmlCompartmentableShape >> figuresDo: aBlock [
	^ self figures do: aBlock
]

{ #category : #initialization }
OPUmlCompartmentableShape >> initialize [
	super initialize.
	(sharedStyle := OPUmlStyle new)
		fillColor: Color veryVeryLightGray;
		strokeColor: Color black;
		strokeWidth: 1
]

{ #category : #'Roassal2 - accessing' }
OPUmlCompartmentableShape >> labels [

	^ RTGroup withAll:
		  (self ownedElements select: [ :each | each isKindOf: OPUmlLabel ])
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> layout [
	| rect minSize off |
	RTVerticalLineLayout new
		gapSize: 0;
		on: self figures.
	rect := self figures encompassingRectangle.
	rect := rect expandBy: 2 @ 2.
	(rect width % 20) isZero
		ifFalse: [ rect := rect withWidth: (rect width roundUpTo: 20) ].
	(rect height % 20) isZero
		ifFalse: [ rect := rect withHeight: (rect height roundUpTo: 20) ].
	minSize := 0 @ 0 corner: 140 @ 60.
	rect width < minSize width
		ifTrue: [ rect := rect withWidth: minSize width ].
	rect height < minSize height
		ifTrue: [ rect := rect withHeight: minSize height ].
	self rtElement trachelShape extent: rect width @ rect height.
	off := self rtElement trachelShape encompassingRectangle center - rect center.
	off := off asIntegerPoint + (5 @ 5).
	self figures do: [ :e | e translateBy: off ]
]

{ #category : #'Roassal2 - accessing' }
OPUmlCompartmentableShape >> minWidth [
	^ 500 max: (self ownedElements ifEmpty: [ 0 ] ifNotEmpty: [ :f | f max: #minWidth ])
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> remove [
	self separators select: [ :each | each view isNotNil ] thenDo: #remove.
	self figures select: [ :each | each view isNotNil ] thenDo: #remove.
	self figures do: [ :each | each owningElement: nil ].
	self compartments select: [ :each | each view isNotNil ] thenDo: #remove.
	self compartments do: [ :each | each owningElement: nil ].
	self rtElement view ifNotNil: [ self rtElement remove ].
	view ifNotNil: [ view signalUpdate ].
	view := nil
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> renderIn: aView [
	view := aView.
	view add: self rtElement.
	self rtElement
		addCallback:
			(TRTranslationCallback
				block:
					[ :shape :step | 
					self figures translateBy: step.
					self separators translateBy: step ]).
	self updateContent
]

{ #category : #'Roassal2 - accessing' }
OPUmlCompartmentableShape >> separators [
	^ self compartments collect: #rtElement as: RTGroup
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> update [
	view ifNil: [ ^ self ].
	self updateContent.
	self updateConnectedEdges.
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> update: aParameter [
	self figuresDo: [ :each | each update: aParameter ].
	self update
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> updateContent [
	view ifNil: [ ^ self ].
	self rtElement shape borderColor: self style strokeColor.
	self rtElement update.
	self figures
		select: [ :each | each view isNil ]
		thenDo: [ :each | each renderIn: view ].
	self layout.
	self updateSeparators.
	self rtElement trachelShape triggerCallbacksForStep: 0 @ 0
]

{ #category : #'Roassal2 - updating' }
OPUmlCompartmentableShape >> updateSeparators [
	| x y |
	self separators select: [ :each | each view isNil ] thenDo: [ :each | view add: each ].
	x := self encompassingRectangle left.
	y := self labels
		ifEmpty: [ self encompassingRectangle top ]
		ifNotEmpty: [ :lbls | lbls last encompassingRectangle bottom ].
	self compartments
		do: [ :each | 
			each ownedElements
				ifEmpty: [ each rtElement shape path: 'L 0 0' ]
				ifNotEmpty: [ each rtElement shape path: 'L ' , self width asString , ' 0' ].
			each rtElement translateTo: x @ y.
			each rtElement update.
			each ownedElements
				ifNotEmpty: [ y := each ownedElements last encompassingRectangle bottom ] ]
]
