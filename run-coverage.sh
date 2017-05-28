#!/usr/bin/env bash

set -eu

SMALLTALK_VM="$(find $SMALLTALK_CI_VMS -name pharo -type f -executable | head -n 1) --nodisplay"
#SMALLTALK_VM="$(find . -name pharo-ui -type f -executable | head -n 1)"
#SMALLTALK_CI_IMAGE="$(find . -name TravisCI.image | tail -n 1)"
#TRAVIS_BUILD_DIR="/home/ubuntu/uml-shapes"

readonly COVERAGE_DIR=$(readlink -m $(dirname $SMALLTALK_CI_IMAGE))
readonly COVERAGE_IMAGE=$COVERAGE_DIR/coverage.image

copy_image() {
	$SMALLTALK_VM $SMALLTALK_CI_IMAGE save coverage
}

run_coverage() {
	$SMALLTALK_VM $COVERAGE_IMAGE eval "|file ci|
Gofer new smalltalkhubUser: 'ObjectProfile' project: 'Spy2'; configurationOf: 'Spy2'; loadBleedingEdge.

buildDir := '$TRAVIS_BUILD_DIR' asFileReference.
coverageDir := buildDir / 'coverage-result'.
confFile := buildDir / '.smalltalk.ston'.
conf := SmalltalkCISpec fromStream: confFile readStream.
conf coverageDictionary at: #packages ifPresent: [ :pkgs |
	pkgs do: [ :pkgName | |coverage view pkgDir|
		coverage := Hapao2 runTestsForPackageNamed: pkgName.
		view := RTView new.
		coverage visualizeOn: view.
		pkgDir := coverageDir / pkgName.
		pkgDir ensureCreateDirectory.
		RTHTML5Exporter new
			directory: pkgDir;
			export: view.
	].
].
"
}

print_startup_info() {
	$SMALLTALK_VM $COVERAGE_IMAGE eval 'StartupPreferencesLoader preferencesGeneralFolder'
	$SMALLTALK_VM $COVERAGE_IMAGE eval 'StartupPreferencesLoader preferencesVersionLoader'
	find package-cache
	find $($SMALLTALK_VM $COVERAGE_IMAGE eval 'StartupPreferencesLoader preferencesGeneralFolder')
}

main() {
	echo "build dir: $TRAVIS_BUILD_DIR"
	echo "VM: $SMALLTALK_VM"
	echo "image: $SMALLTALK_CI_IMAGE"
	copy_image
	echo "coverage image: $COVERAGE_IMAGE"
	run_coverage
	find $TRAVIS_BUILD_DIR/coverage-result
	print_startup_info
}

main