Roassal2 - accessing
emphasis
	| emph |
	emph := Set new.
	self style fontBold
		ifTrue: [ emph add: TextEmphasis bold ].
	self style fontItalic
		ifTrue: [ emph add: TextEmphasis italic ].
	self style fontUnderline
		ifTrue: [ emph add: TextEmphasis underlined ].
	^ emph