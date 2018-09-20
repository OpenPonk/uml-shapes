Class {
	#name : #OPDIStyle,
	#superclass : #Object,
	#instVars : [
		'styledElement'
	],
	#category : 'OpenPonk-UML-DI-DiagramInterchange'
}

{ #category : #testing }
OPDIStyle class >> isAbstract [
	^ self = OPDIStyle
]

{ #category : #accessing }
OPDIStyle >> styledElement [
	^ styledElement
]

{ #category : #accessing }
OPDIStyle >> styledElement: aDiagramElement [
	styledElement := aDiagramElement
]
