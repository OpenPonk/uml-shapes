*OpenPonk-UML-DI
resize: backElement bounds: encompassingRectangle padding: aPadding
	"it translates backElement, but does not trigger events."

	backElement updateEdgesOFF.
	backElement trachelShape
		doWithoutCallbacks: [ backElement
				extent:
					(encompassingRectangle width + (aPadding * 2))
						@ (encompassingRectangle height + (aPadding * 2)).
			backElement translateTo: encompassingRectangle center ].
	backElement updateEdgesON