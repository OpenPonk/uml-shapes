Class {
	#name : #OPUMLRTInteractiveViewContext,
	#superclass : #RTAbstractViewContext,
	#category : 'OpenPonk-UML-DI-Roassal'
}

{ #category : #hooks }
OPUMLRTInteractiveViewContext >> interactionsToBeRegistered [
	^ Array with: OPUMLRTSelectableElementsContextInteraction with: RTResizeableViewContextInteraction
]
