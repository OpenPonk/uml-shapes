accessing
owningElement: aDiagramElement
	owningElement := SRToOneLink
		on: self
		slot: #owningElement
		oppositeSlot: #ownedElements
		updateFrom: owningElement
		to: aDiagramElement