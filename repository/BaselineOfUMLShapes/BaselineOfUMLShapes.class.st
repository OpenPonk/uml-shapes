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
							'github://ObjectProfile/Roassal2:614d7b80eebf6af33a777cec55ecc1c6a7a65482/src' ].
			spec
				baseline: 'SynchronizedLinks'
				with: [ spec repository: 'github://openponk/synchronized-links:v2.0.0/repository' ].
			spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:v2.0.1/repository' ].
			spec
				package: 'OpenPonk-UML-DI'
				with: [ spec requires: #('Roassal2' 'SynchronizedLinks') ].
			spec group: 'plugin' with: #('OpenPonk-UML-DI').
			spec group: 'default' with: #('OpenPonk' 'plugin') ]
]
