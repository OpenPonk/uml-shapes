Class {
	#name : #OPTRTextDiamondMarkerShape,
	#superclass : #TRFilledDiamondShape,
	#instVars : [
		'text',
		'fillColor'
	],
	#category : 'OpenPonk-UML-DI-Trachel'
}

{ #category : #hooks }
OPTRTextDiamondMarkerShape >> computePath [
	| vector r u unit middle endPoint |
	vector := self to - self from.
	r := vector r.
	r = 0
		ifTrue: [ ^ false ].
	u := vector normal.
	unit := vector / r.
	endPoint := self to - (vector * (1 - percentage)).
	end := endPoint - (2 * unit * size).
	middle := endPoint - (unit * size).
	left := middle - (u * size * 0.7).
	right := middle + (u * size * 0.7).
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: end;
				lineTo: left;
				lineTo: endPoint;
				lineTo: right;
				lineTo: end ]
]

{ #category : #drawing }
OPTRTextDiamondMarkerShape >> drawOn: athensCanvas [
	| font vector r u unit middle endPoint |
	from = to
		ifTrue: [ ^ self ].
	athensCanvas pathTransform
		restoreAfter: [ athensCanvas setShape: self path.
			athensCanvas setPaint: self fillColor.
			athensCanvas draw.
			(athensCanvas setStrokePaint: strokePaint) width: self width.
			athensCanvas draw ].
	font := TRLabelShape getFontForSize: 9.
	font := font emphasized: TextEmphasis bold emphasisCode.
	vector := self to - self from.
	r := vector r.
	r = 0
		ifTrue: [ ^ false ].
	u := vector normal.
	unit := vector / r.
	endPoint := self to - (vector * (1 - percentage)).
	middle := endPoint - (unit * size).
	athensCanvas pathTransform
		restoreAfter: [ athensCanvas pathTransform
				translateBy: middle asFloatPoint;
				translateBy: ((size negated / 2) @ (font height / 4)) asFloatPoint.
			athensCanvas setFont: font.
			athensCanvas setPaint: self fillColor negated.
			athensCanvas drawString: text ]
]

{ #category : #accessing }
OPTRTextDiamondMarkerShape >> fillColor [
	^ fillColor ifNil: [ color ]
]

{ #category : #accessing }
OPTRTextDiamondMarkerShape >> fillColor: aColor [
	fillColor := aColor
]

{ #category : #accessing }
OPTRTextDiamondMarkerShape >> from: aPoint to: anotherPoint width: aNumber size: anotherNumber color: aColor stroke: anotherColor [
	^ self
		from: aPoint;
		to: anotherPoint;
		width: aNumber;
		size: anotherNumber;
		color: aColor;
		strokePaint: anotherColor
]

{ #category : #accessing }
OPTRTextDiamondMarkerShape >> text: anObject [
	text := anObject
]
