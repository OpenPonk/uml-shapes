baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				project: 'Roassal2'
					with: [ spec
						className: #ConfigurationOfRoassal2;
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ];
				project: 'Fame'
					with: [ spec
						className: #ConfigurationOfFame;
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/Moose/Fame/main' ].
			spec package: 'OpenPonk-UML-DI' with: [ spec requires: #('Roassal2' 'Fame') ].
			spec group: 'default' with: #('OpenPonk-UML-DI') ]