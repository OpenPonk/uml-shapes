initialization
initialize
	super initialize.
	isIcon := false.
	localStyle := nil.
	sharedStyle := nil.
	ownedElements := SRToManyLink on: self slot: #ownedElements oppositeSlot: #owningElement.
	owningElement := nil.
	modelElement := nil.
	self flag: 'This looks strange'.
	sourceEdges := SRToManyLink on: self slot: #sourceEdges oppositeSlot: #source.
	targetEdges := SRToManyLink on: self slot: #targetEdges oppositeSlot: #target.