Class {
	#name : #OPUmlStyleTest,
	#superclass : #OPDITestCase,
	#category : 'OpenPonk-UML-DI-Tests'
}

{ #category : #accessing }
OPUmlStyleTest >> elementClass [
	^ OPUmlStyle
]

{ #category : #accessing }
OPUmlStyleTest >> testLocalStyleNotInherited [
	| a b |
	a := OPUmlDiagramElement new.
	(b := OPUmlDiagramElement new) owningElement: a.
	self assert: a style equals: nil.
	self assert: b style equals: nil.
	a localStyle: element.
	self assert: a style equals: element.
	self assert: b style equals: nil
]

{ #category : #accessing }
OPUmlStyleTest >> testPropertyInheritance [
	| a b aStyle bShared bLocal |
	a := OPUmlDiagramElement new.
	(b := OPUmlDiagramElement new) owningElement: a.
	(aStyle := OPUmlStyle new) fontSize: 15.
	a sharedStyle: aStyle.
	self assert: b style fontSize equals: 15.
	bShared := OPUmlStyle new.
	b sharedStyle: bShared.
	self assert: b style fontSize equals: 15.
	bShared fontSize: 20.
	self assert: b style fontSize equals: 20.
	bLocal := OPUmlStyle new.
	b localStyle: bLocal.
	self assert: b style fontSize equals: 20.
	bLocal fontSize: 25.
	self assert: b style fontSize equals: 25.
	bLocal removeKey: #fontSize.
	self assert: b style fontSize equals: 20.
	bShared removeKey: #fontSize.
	self assert: b style fontSize equals: 15
]

{ #category : #accessing }
OPUmlStyleTest >> testSharedStyleIsInherited [
	| a b |
	a := OPUmlDiagramElement new.
	(b := OPUmlDiagramElement new) owningElement: a.
	self assert: a style equals: nil.
	self assert: b style equals: nil.
	a sharedStyle: element.
	self assert: a style equals: element.
	self assert: b style equals: element
]

{ #category : #accessing }
OPUmlStyleTest >> testSharedStyleOverriden [
	| a b newStyle |
	a := OPUmlDiagramElement new.
	(b := OPUmlDiagramElement new) owningElement: a.
	a sharedStyle: element.
	self assert: a style equals: element.
	self assert: b style equals: element.
	newStyle := OPUmlStyle new.
	b localStyle: newStyle.
	self assert: b style equals: newStyle.
	self assert: b sharedStyle equals: element
]
