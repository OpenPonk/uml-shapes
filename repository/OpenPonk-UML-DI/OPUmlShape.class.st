Class {
	#name : #OPUmlShape,
	#superclass : #OPUmlDiagramElement,
	#instVars : [
		'rtElement'
	],
	#category : 'OpenPonk-UML-DI-UML'
}

{ #category : #Roassal2 }
OPUmlShape >> center [
	^ self rtElement center
]

{ #category : #'Roassal2 - updating' }
OPUmlShape >> changed: aParameter [
	self owningElement
		ifNil: [ self update: aParameter ]
		ifNotNil: [ self owningElement changed: aParameter ]
]

{ #category : #'Roassal2 - manipulation' }
OPUmlShape >> createRtElement [
	^ self subclassResponsibility
]

{ #category : #Roassal2 }
OPUmlShape >> encompassingRectangle [
	^ self rtElement encompassingRectangle
]

{ #category : #Roassal2 }
OPUmlShape >> extent [
	^ self rtElement extent
]

{ #category : #Roassal2 }
OPUmlShape >> extent: aPoint [
	^ self rtElement extent: aPoint
]

{ #category : #Roassal2 }
OPUmlShape >> height [
	^ self rtElement height
]

{ #category : #Roassal2 }
OPUmlShape >> height: aValue [
	^ self rtElement height: aValue
]

{ #category : #Roassal2 }
OPUmlShape >> position [
	^ self rtElement position
]

{ #category : #'Roassal2 - accessing' }
OPUmlShape >> rtElement [
	^ rtElement ifNil: [ rtElement := self createRtElement ]
]

{ #category : #Roassal2 }
OPUmlShape >> translateBy: aPoint [
	self rtElement translateBy: aPoint
]

{ #category : #Roassal2 }
OPUmlShape >> translateTo: aPoint [
	self rtElement translateTo: aPoint
]

{ #category : #'Roassal2 - updating' }
OPUmlShape >> update [
	self rtElement update.
	self updateConnectedEdges
]

{ #category : #'Roassal2 - updating' }
OPUmlShape >> update: aParameter [
	self update
]

{ #category : #'Roassal2 - updating' }
OPUmlShape >> updateConnectedEdges [
	self sourceEdges do: #update.
	self targetEdges do: #update
]

{ #category : #'Roassal2 - accessing' }
OPUmlShape >> view [
	^ self rtElement view
]

{ #category : #Roassal2 }
OPUmlShape >> width [
	^ self rtElement width
]

{ #category : #Roassal2 }
OPUmlShape >> width: aValue [
	self rtElement width: aValue
]
