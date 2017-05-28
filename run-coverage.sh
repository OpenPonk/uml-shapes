#!/usr/bin/env bash

readonly COVERAGE_DIR=$(readlink -m $(dirname $SMALLTALK_CI_IMAGE))
readonly COVERAGE_IMAGE=$COVERAGE_DIR/coverage.image

copy_image() {
	$SMALLTALK_VM $SMALLTALK_CI_IMAGE save coverage
}

run_coverage() {
	$SMALLTALK_VM --nodisplay $COVERAGE_IMAGE "|file ci|
Gofer new smalltalkhubUser: 'ObjectProfile' project: 'Spy2'; configurationOf: 'Spy2'; loadBleedingEdge.
file := FileLocator workingDirectory.
ci := SmalltalkCISpec fromStream: file readStream.
ci coverageEnabled.
ci coverageDictionary at: #packages ifPresent: [ :pkgs |
	pkgs do: [ :pkg | |coverage view|
		coverage := Hapao2 runTestsForPackage: pkg.
		view := RTView new.
		coverage visualizeOn: view.
		RTHTML5Exporter new
			directory: FileLocator workingDirectory / 'coverage-result' / pkg name;
			export: view.
	].
]."
}

upload_coverage() {
	find coverage-result -type f -exec curl -u $FTP_USER:$FTP_PASSWORD --ftp-create-dirs -T {} ftpes://ghcoverage.peteruhnak.com/uml-shapes/$TRAVIS_BUILD_NUMBER/{} \;
}

main() {
	copy_image
	run_coverage
	upload_coverage
}

main