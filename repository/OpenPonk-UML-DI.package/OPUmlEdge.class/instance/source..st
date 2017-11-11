accessing
source: aDiagramElement
	source := SRToOneLink
		on: self
		slot: #source
		oppositeSlot: #sourceEdges
		updateFrom: source
		to: aDiagramElement