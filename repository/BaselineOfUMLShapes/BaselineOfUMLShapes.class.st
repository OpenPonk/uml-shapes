"
Baseline for https://github.com/OpenPonk/uml-shapes
"
Class {
	#name : #BaselineOfUMLShapes,
	#superclass : #BaselineOf,
	#category : #BaselineOfUMLShapes
}

{ #category : #baseline }
BaselineOfUMLShapes >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Roassal2'
				with: [ spec
						repository:
							'github://ObjectProfile/Roassal2:004ab6f3dfd41cf06526c57115ee42cc921e7668/src' ].
			spec
				baseline: 'SynchronizedLinks'
				with: [ spec
						repository: 'github://openponk/synchronized-links:v1.x/repository' ].
			spec
				package: 'OpenPonk-UML-DI'
				with: [ spec requires: #('Roassal2' 'SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-UML-DI') ]
]
