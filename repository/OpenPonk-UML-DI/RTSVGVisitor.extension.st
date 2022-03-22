Extension { #name : #RTSVGVisitor }

{ #category : #'*OpenPonk-UML-DI' }
RTSVGVisitor >> visitTextDiamondShape: shape onStart: aBoolean [

	| aid color bColor w s svgE decorationInfo |
	decorationInfo := RTLineDecorationInfo new decoration: shape.
	aBoolean ifTrue: [ decorationInfo onStart ].
	aid := RTSVGAbstractLine getDecorationId: decorationInfo.
	color := shape fillColor.
	bColor := shape strokePaint.
	w := shape width.
	s := shape mySize.
	(markers includes: aid) ifFalse: [ 
		svgE := RTSVGDiamondMarker new
			        id: aid
			        fillColor: color
			        borderColor: bColor
			        width: w
			        size: s;
			        yourself.
		aBoolean ifTrue: [ svgE onStart ].
		svgE addOn: stream using: self.
		markers add: aid ]
]
