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
	spec for: #common do: [ 
		spec baseline: 'Roassal2' with: [ 
			spec
				repository: 'github://OpenPonk/Roassal2:Pharo10';
				loads: 'Core' ].
		spec
			baseline: 'SynchronizedLinks'
			with: [ 
			spec repository: 'github://openponk/synchronized-links/repository' ].
		spec
			baseline: 'OpenPonk'
			with: [ spec repository: 'github://openponk/openponk:dev-roassal3' ].
		spec
			package: 'OpenPonk-UML-DI'
			with: [ spec requires: #( 'Roassal2' 'SynchronizedLinks' ) ];
			preLoadDoIt: #loadPetitParserAndRoassal3.
		spec group: 'plugin' with: #( 'OpenPonk-UML-DI' ).
		spec group: 'default' with: #( 'OpenPonk' 'plugin' ) ]
]

{ #category : #'as yet unclassified' }
BaselineOfUMLShapes >> loadPetitParser [

	"PetitParser is not needed by UML Shapes. It is needed by BormEditor, but due to Pharo bug https://github.com/pharo-project/pharo/issues/9913 it must be always loaded before Roassal2 in Pharo 10"

	Smalltalk at: #BaselineOfPetitParser ifPresent: [ ^ self ].
	Metacello new
		baseline: 'PetitParser';
		repository: 'github://moosetechnology/PetitParser:v3.x.x/src';
		load:
			#( 'Core' 'Tests' 'Examples' 'Islands' 'Analyzer' 'Preprocessor'
			   'Indent' 'Extension' 'TestsExtension' 'Parser' )
]

{ #category : #'as yet unclassified' }
BaselineOfUMLShapes >> loadPetitParserAndRoassal3 [

	"PetitParser is not needed by core OP. It is needed by BormEditor, but due to Pharo bug https://github.com/pharo-project/pharo/issues/9913 it must be always loaded before Roassal in Pharo 10"

	self
		loadPetitParser;
		loadRoassal3
]

{ #category : #'as yet unclassified' }
BaselineOfUMLShapes >> loadRoassal3 [

	"Roassal3 needs to be loaded this way because different version of it is already included in Pharo 10+"

	Smalltalk at: #BaselineOfRoassal3Exporters ifPresent: [ ^ self ].
	[ 
	Metacello new
		baseline: 'Roassal3';
		"repository: 'github://ObjectProfile/Roassal3:v0.9.9k';"
		repository: 'github://OpenPonk/Roassal3';
		lock;
		load: #Full ]
		on: MCMergeOrLoadWarning
		do: [ :warning | warning load ].
	Metacello new
		baseline: 'Roassal3Exporters';
		repository: 'github://ObjectProfile/Roassal3Exporters:f2f81e9';
		load
]
