testing
isFor: anElement
	^ anElement isEdge and: [ anElement model isKindOf: OPUmlEdge ]