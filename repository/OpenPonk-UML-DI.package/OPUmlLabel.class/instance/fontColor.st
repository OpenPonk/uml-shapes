Roassal2 - accessing
fontColor
	| fontColor |
	fontColor := self style fontColor.
	fontColor isBlock
		ifTrue: [ ^ fontColor cull: self modelElement ].
	^ fontColor