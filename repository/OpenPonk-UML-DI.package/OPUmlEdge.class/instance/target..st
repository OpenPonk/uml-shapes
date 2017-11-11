accessing
target: aDiagramElement
	target := SRToOneLink
		on: self
		slot: #target
		oppositeSlot: #targetEdges
		updateFrom: target
		to: aDiagramElement