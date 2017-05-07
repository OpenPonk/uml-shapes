accessing
text
	(text isString and: [ text isSymbol not ])
		ifTrue: [ ^ text ].
	^ text value: self modelElement