protocol
remove
	self hasStore
		ifFalse: [ ^ self ].
	model model style strokeColor: self load.
	self clearStore.
	model model update