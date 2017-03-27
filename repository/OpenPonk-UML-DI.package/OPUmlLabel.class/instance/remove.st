Roassal2 - manipulation
remove
	| view |
	view := self rtElement view.
	view ifNil: [ ^ self ].
	self rtElement remove.
	view signalUpdate