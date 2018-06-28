protocol
highlight: anEdge color: aColor
	self hasStore
		ifTrue: [ ^ self ].
	model := anEdge.
	self store: model model style strokeColor.
	model model style strokeColor: aColor.
	model model update