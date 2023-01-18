Class {
	#name : #OPUmlLabelTest,
	#superclass : #OPDITestCase,
	#category : #'OpenPonk-UML-DI-Tests'
}

{ #category : #tests }
OPUmlLabelTest >> elementClass [
	^ OPUmlLabel
]

{ #category : #tests }
OPUmlLabelTest >> testBlockNameUpdate [
	element modelElement: 'hello'.
	element text: #yourself.
	rt := element rtElement.
	self assert: (rt shape textFor: rt) equals: 'hello'.
	element modelElement: 'world'.
	self assert: (rt shape textFor: rt) equals: 'world'
]

{ #category : #tests }
OPUmlLabelTest >> testRtElement [
	element text: 'some text'.
	rt := element rtElement.
	self assert: rt class equals: RTElement.
	self assert: rt shape class equals: RTStyledLabel.
	self assert: (rt shape textFor: rt) equals: 'some text'
]

{ #category : #tests }
OPUmlLabelTest >> testRtEmphasis [
	element text: 'some text'.
	element localStyle: OPDIOpenPonkStyle new.
	rt := element rtElement.
	self assertCollection: (rt shape emphasisFor: rt) hasSameElements: #().

	element localStyle fontBold: true.
	self assertCollection: (rt shape emphasisFor: rt) hasSameElements: {TextEmphasis bold}.

	element localStyle fontUnderline: true.
	self
		assertCollection: (rt shape emphasisFor: rt)
		hasSameElements:
			{TextEmphasis bold.
			TextEmphasis underlined}.

	element localStyle fontItalic: true.
	self
		assertCollection: (rt shape emphasisFor: rt)
		hasSameElements:
			{TextEmphasis bold.
			TextEmphasis underlined.
			TextEmphasis italic}
]

{ #category : #tests }
OPUmlLabelTest >> testRtEmphasisUpdate [
	element text: 'some text'.
	element
		emphasis: [ :model :localStyle | 
			localStyle fontBold: model first.
			localStyle fontItalic: model second ].
	element localStyle: OPDIOpenPonkStyle new.
	element modelElement: #(true true).
	rt := element rtElement.
	self
		assertCollection: (rt shape emphasisFor: rt)
		hasSameElements:
			{TextEmphasis bold.
			TextEmphasis italic}.
	element modelElement: #(true false).
	self assertCollection: (rt shape emphasisFor: rt) hasSameElements: {TextEmphasis bold}
]

{ #category : #tests }
OPUmlLabelTest >> testRtNameUpdate [
	element text: 'some text'.
	rt := element rtElement.
	self assert: (rt shape textFor: rt) equals: 'some text'.
	element text: 'new text'.
	self assert: (rt shape textFor: rt) equals: 'new text'
]
