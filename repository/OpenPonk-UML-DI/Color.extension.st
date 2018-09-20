Extension { #name : #Color }

{ #category : #'*OpenPonk-UML-DI' }
Color class >> aqua [
	^ ColorRegistry at: #aqua ifAbsentPut: [ self fromHexString: '00ffff' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> fuchsia [
	^ ColorRegistry at: #fuchsia ifAbsentPut: [ self fromHexString: 'ff00ff' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> knownColors [
	^ #(maroon red orange yellow olive purple fuchsia white lime green navy blue aqua teal black silver gray)
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> lime [
	^ ColorRegistry at: #lime ifAbsentPut: [ self fromHexString: '00ff00' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> maroon [
	^ ColorRegistry at: #maroon ifAbsentPut: [ self fromHexString: '800000' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> navy [
	^ ColorRegistry at: #navy ifAbsentPut: [ self fromHexString: '000080' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> olive [
	^ ColorRegistry at: #olive ifAbsentPut: [ self fromHexString: '808000' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> silver [
	^ ColorRegistry at: #silver ifAbsentPut: [ self fromHexString: 'c0c0c0' ]
]

{ #category : #'*OpenPonk-UML-DI' }
Color class >> teal [
	^ ColorRegistry at: #teal ifAbsentPut: [ self fromHexString: '008080' ]
]
