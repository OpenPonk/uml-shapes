Extension { #name : #RTNestingBehavior }

{ #category : #'*OpenPonk-UML-DI' }
RTNestingBehavior >> resize: backElement bounds: encompassingRectangle padding: aPadding [
	"it translates backElement, but does not trigger events."

	backElement updateEdgesOFF.
	backElement trachelShape
		doWithoutCallbacks: [ backElement
				extent:
					(encompassingRectangle width + (aPadding * 2))
						@ (encompassingRectangle height + (aPadding * 2)).
			backElement translateTo: encompassingRectangle center ].
	backElement updateEdgesON
]

{ #category : #'*OpenPonk-UML-DI' }
RTNestingBehavior >> resize: backElement for: elements padding: aPadding [
	self resize: backElement bounds: elements encompassingRectangle padding: aPadding
]
