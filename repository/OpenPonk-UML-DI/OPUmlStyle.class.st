Class {
	#name : #OPUmlStyle,
	#superclass : #OPDIStyle,
	#category : #'OpenPonk-UML-DI-UML'
}

{ #category : #accessing }
OPUmlStyle >> fillColor [
	^ self at: #fillColor
]

{ #category : #accessing }
OPUmlStyle >> fillColor: aColor [
	self at: #fillColor put: aColor
]

{ #category : #accessing }
OPUmlStyle >> fillOpacity [
	^ self at: #fillOpacity
]

{ #category : #accessing }
OPUmlStyle >> fillOpacity: aNumber [
	self at: #fillOpacity put: aNumber
]

{ #category : #accessing }
OPUmlStyle >> fontBold [
	^ self at: #fontBold
]

{ #category : #accessing }
OPUmlStyle >> fontBold: aBoolean [
	self at: #fontBold put: aBoolean
]

{ #category : #accessing }
OPUmlStyle >> fontColor [
	^ self at: #fontColor
]

{ #category : #accessing }
OPUmlStyle >> fontColor: aColor [
	self at: #fontColor put: aColor
]

{ #category : #accessing }
OPUmlStyle >> fontItalic [
	^ self at: #fontItalic
]

{ #category : #accessing }
OPUmlStyle >> fontItalic: aBoolean [
	self at: #fontItalic put: aBoolean
]

{ #category : #accessing }
OPUmlStyle >> fontName [
	^ self at: #fontName
]

{ #category : #accessing }
OPUmlStyle >> fontName: aFontName [
	self at: #fontName put: aFontName
]

{ #category : #accessing }
OPUmlStyle >> fontSize [
	^ self at: #fontSize
]

{ #category : #accessing }
OPUmlStyle >> fontSize: aFontSize [
	self at: #fontSize put: aFontSize
]

{ #category : #accessing }
OPUmlStyle >> fontStrikeThrough [
	^ self at: #fontStrikeThrough
]

{ #category : #accessing }
OPUmlStyle >> fontStrikeThrough: aBoolean [
	self at: #fontStrikeThrough put: aBoolean
]

{ #category : #accessing }
OPUmlStyle >> fontUnderline [
	^ self at: #fontUnderline
]

{ #category : #accessing }
OPUmlStyle >> fontUnderline: aBoolean [
	self at: #fontUnderline put: aBoolean
]

{ #category : #accessing }
OPUmlStyle >> strokeColor [
	^ self at: #strokeColor
]

{ #category : #accessing }
OPUmlStyle >> strokeColor: aColor [
	self at: #strokeColor put: aColor
]

{ #category : #accessing }
OPUmlStyle >> strokeDashLength [
	^ self at: #strokeDashLength
]

{ #category : #accessing }
OPUmlStyle >> strokeDashLength: aCollection [
	self at: #strokeDashLength put: aCollection
]

{ #category : #accessing }
OPUmlStyle >> strokeOpacity [
	^ self at: #strokeOpacity
]

{ #category : #accessing }
OPUmlStyle >> strokeOpacity: aNumber [
	self at: #strokeOpacity put: aNumber
]

{ #category : #accessing }
OPUmlStyle >> strokeWidth [
	^ self at: #strokeWidth
]

{ #category : #accessing }
OPUmlStyle >> strokeWidth: aNumber [
	self at: #strokeWidth put: aNumber
]
