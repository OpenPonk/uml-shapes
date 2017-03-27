*OpenPonk-UML-DI-Roassal2
rtElement
	^ rtElement ifNil: [ rtElement := self createRtElement ]