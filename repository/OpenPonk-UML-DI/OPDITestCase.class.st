Class {
	#name : #OPDITestCase,
	#superclass : #TestCase,
	#instVars : [
		'element',
		'rt'
	],
	#category : 'OpenPonk-UML-DI-Tests'
}

{ #category : #testing }
OPDITestCase class >> isAbstract [
	^ self = OPDITestCase
]

{ #category : #accessing }
OPDITestCase >> elementClass [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
OPDITestCase >> elementInstance [
	^ self elementClass new
]

{ #category : #running }
OPDITestCase >> setUp [
	super setUp.
	element := self elementInstance
]
