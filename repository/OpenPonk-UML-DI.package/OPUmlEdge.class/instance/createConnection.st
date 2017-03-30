Roassal2 - manipulation
createConnection
	^ (#OPRTStyledConnection asClass new
		attachPoint: (#OPRTOrthogonalAttachPoint asClass new offset: 30);
		head: self headDecorator asHead;
		tail: self tailDecorator asTail;
		color: self style strokeColor;
		width: self style strokeWidth;
		edgeFrom: source rtElement to: target rtElement)
		model: self;
		yourself
