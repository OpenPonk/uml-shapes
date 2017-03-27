Roassal2 - manipulation
createRtEdge
	^ (OPRTStyledConnection new
		attachPoint: (OPRTOrthogonalAttachPoint new offset: 30);
		head: self headDecorator asHead;
		tail: self tailDecorator asTail;
		color: self style strokeColor;
		width: self style strokeWidth;
		edgeFrom: source rtElement to: target rtElement)
		model: self;
		yourself