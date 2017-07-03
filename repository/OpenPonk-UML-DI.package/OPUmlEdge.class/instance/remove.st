Roassal2 - manipulation
remove
	self view ifNil: [ ^ self ].
	(self ownedElements select: [ :each | each view isNotNil ]) do: #remove.
	[ self ownedElements notEmpty ]
		whileTrue: [ self ownedElements anyOne owningElement: nil ].
	self rtEdge view ifNotNil: [ self rtEdge remove ].
	view signalUpdate.
	view := nil