Class {
	#name : #OPUmlCompartmentableShapeTest,
	#superclass : #OPDITestCase,
	#category : 'OpenPonk-UML-DI-Tests'
}

{ #category : #accessing }
OPUmlCompartmentableShapeTest >> elementClass [
	^ OPUmlCompartmentableShape
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testEmptyRtElement [
	rt := element rtElement.
	self assert: rt class equals: RTElement.
	self assert: rt shape class equals: RTBox
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testFigures [
	self assert: element figures class equals: RTGroup.
	self assert: element figures size equals: 0
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testFigures1 [
	| lbl |
	(lbl := OPUmlLabel new) owningElement: element.

	self assert: element figures asArray equals: {lbl}
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testFigures2 [
	| lbl comp1 |
	(lbl := OPUmlLabel new) owningElement: element.
	(comp1 := OPUmlCompartment new) owningElement: element.

	self assert: element figures asArray equals: {lbl}
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testFigures3 [
	| lbl comp compLbl |
	(lbl := OPUmlLabel new) owningElement: element.
	(comp := OPUmlCompartment new) owningElement: element.
	(compLbl := OPUmlLabel new) owningElement: comp.

	self assert: element figures asArray equals: (Array with: lbl with: compLbl)
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testRemoveExtentChanged [
	| compartment compLbl view fullExtent |
	OPUmlNameLabel new owningElement: element.
	compartment := OPUmlCompartment new.
	compartment owningElement: element.
	5 timesRepeat: [ (compLbl := OPUmlLabel new) owningElement: compartment ].
	view := RTView new.
	element renderIn: view.
	fullExtent := element extent.
	compLbl remove.
	self assert: element extent y < fullExtent y
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testRemoveFromOwnership [
	| lbl |
	(lbl := OPUmlLabel new) owningElement: element.
	self assert: element figures asArray equals: {lbl}.
	lbl remove.
	self assert: element figures isEmpty
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testRemoveFromViewEmpty [
	| view |
	view := RTView new.
	element renderIn: view.
	element remove.
	self assert: view elements asArray equals: #()
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testRemoveFromViewRich [
	| view lbl comp compLbl |
	element := OPUmlClassifierShape new.
	lbl := OPUmlNameLabel new.
	lbl owningElement: element.
	comp := OPUmlCompartment new.
	comp owningElement: element.
	(compLbl := OPUmlLabel new) owningElement: comp.
	view := RTView new.
	element renderIn: view.
	element remove.
	self assert: view elements asArray equals: #()
]

{ #category : #tests }
OPUmlCompartmentableShapeTest >> testRemoveOwnedElement [
	| lbl |
	(lbl := OPUmlLabel new) owningElement: element.
	self assert: element figures asArray equals: {lbl}.
	lbl owningElement: nil.
	self assert: element figures isEmpty
]
