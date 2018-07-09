Roassal2 - accessing
labels
	self flag: 'I have no idea why there is sorting by priority'.
	^ ((self ownedElements select: [ :each | each isKindOf: OPUmlLabel ])
		sorted: [ :a :b | a class priority < b class priority ]) asGroup