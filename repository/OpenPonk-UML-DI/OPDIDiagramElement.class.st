Class {
	#name : #OPDIDiagramElement,
	#superclass : #Object,
	#instVars : [
		'sharedStyle',
		'localStyle'
	],
	#category : #'OpenPonk-UML-DI-DiagramInterchange'
}

{ #category : #testing }
OPDIDiagramElement class >> isAbstract [
	^ self = OPDIDiagramElement
]

{ #category : #accessing }
OPDIDiagramElement >> localStyle [
	^ localStyle
]

{ #category : #accessing }
OPDIDiagramElement >> localStyle: aStyle [
	(localStyle := aStyle) styledElement: self
]

{ #category : #accessing }
OPDIDiagramElement >> modelElement [
	^ self subclassResponsibility
]

{ #category : #accessing }
OPDIDiagramElement >> ownedElements [
	^ self subclassResponsibility
]

{ #category : #accessing }
OPDIDiagramElement >> owningElement [
	^ self subclassResponsibility
]

{ #category : #removing }
OPDIDiagramElement >> remove [
	self subclassResponsibility
]

{ #category : #accessing }
OPDIDiagramElement >> sharedStyle [
	^ sharedStyle ifNil: [ self owningElement ifNotNil: #sharedStyle ]
]

{ #category : #accessing }
OPDIDiagramElement >> sharedStyle: aStyle [
	(sharedStyle := aStyle) styledElement: self
]

{ #category : #accessing }
OPDIDiagramElement >> sourceEdges [
	^ self subclassResponsibility
]

{ #category : #accessing }
OPDIDiagramElement >> style [
	^ self localStyle ifNil: [ self sharedStyle ]
]

{ #category : #accessing }
OPDIDiagramElement >> targetEdges [
	^ self subclassResponsibility
]
