"
Baseline for https://github.com/OpenPonk/uml-shapes
"
Class {
	#name : #BaselineOfUMLShapes,
	#superclass : #BaselineOf,
	#category : 'BaselineOfUMLShapes'
}

{ #category : #baseline }
BaselineOfUMLShapes >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Roassal2'
				with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].
			spec
				baseline: 'SynchronizedLinks'
				with: [ spec
						repository: 'github://openponk/synchronized-links:v1.x/repository' ].
			spec
				package: 'OpenPonk-UML-DI'
				with: [ spec requires: #('Roassal2' 'SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-UML-DI') ]
]
