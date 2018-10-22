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
				project: 'Roassal2'
				with: [ spec
						className: #ConfigurationOfRoassal2;
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
			spec
				baseline: 'SynchronizedLinks'
				with: [ spec repository: 'github://openponk/synchronized-links:v1.x/repository' ].
			spec
				package: 'OpenPonk-UML-DI'
				with: [ spec requires: #('Roassal2' 'SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-UML-DI') ]

]
