Roassal2 - manipulation
createRtElement
	| shape |
	shape := OPDEPackageShape on: self.
	shape shape
		color: [ :model | model style fillColor ];
		borderColor: self style strokeColor;
		borderWidth: self style strokeWidth.
	shape labelText: [ :model | model modelElement name ].
	shape stereotypeText: [ :model | '' ].
	shape showTriangle: [ :model | model modelElement isKindOf: OPUMLModel ].
	^ shape