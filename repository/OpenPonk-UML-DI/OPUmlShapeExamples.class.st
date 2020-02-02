Class {
	#name : #OPUmlShapeExamples,
	#superclass : #RTAbstractExample,
	#category : 'OpenPonk-UML-DI-Examples'
}

{ #category : #'as yet unclassified' }
OPUmlShapeExamples class >> editExample [
	<script>
	| page playground |
	(page := GTPlayPage new) saveContent: (((self class >> #sampleExampleEdit) sourceCode lines allButFirst: 2) joinUsing: String cr).
	(playground := GTPlayground new) openOn: page
]

{ #category : #'as yet unclassified' }
OPUmlShapeExamples class >> open [
	<script>
	self new inspect
]

{ #category : #'as yet unclassified' }
OPUmlShapeExamples class >> sampleExampleEdit [
| page playground |
(page := GTPlayPage new)
	saveContent: '|v|
v := RTView new.

^ v'.
(playground := GTPlayground new)
	openOn: page.

OPUmlShapeExamples new installTitle: 'label' capitalized code: page content.

page saveContent: 'new content'.
playground update.
]

{ #category : #sources }
OPUmlShapeExamples >> exampleClassifier [
| el lbl comp compLbl v |
el := OPUmlClassifierShape new.
lbl := OPUmlNameLabel new.
lbl text: 'Name'.
lbl localStyle: (OPUmlStyle new fontSize: 11).
lbl owningElement: el.
comp := OPUmlCompartment new.
comp owningElement: el.
(compLbl := OPUmlLabel new)
	owningElement: comp;
	text: 'attr'.
v := RTView new.
el renderIn: v.
el rtElement when: TRMouseLeftClick do: [ :evt |  ].
el rtElement @ RTResizable @ RTDraggable.
^ v
]

{ #category : #icons }
OPUmlShapeExamples >> exampleClassifierIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABnklEQVR4XuXUMYrCUBhGUbfn
jux0EzYWSSNoooWkMEREsEgRCGmyAHdh6S/jApwpJDOTc+FrHq/K4WUS4feXmvifwAfx80F8
ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNB
fBA/H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/EbK8hisYjdbjfYLpfLwwd503a7
jdvt9u2+7h0Ohx/dfTcf5EMg6/U6ptNp7Pf7mM/nkSRJdF0Xy+Uy0jT1QYYGuV6vsdlsIsuy
qKoq6rp+nZdl+ULyQQYG+dR8EB/k/4G0bRvH4zFms1msVqvo+94H+U2QpmnifD5HURSR57n/
Qvxflg/ig/ggPogP4oP4ID7I2EBOp9NjyN3vdx/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8
ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNB
fBA/H8TPB/FB/HwQH8TPBxllT6Nazi2hk0CEAAAAAElFTkSuQmCC'
]

{ #category : #sources }
OPUmlShapeExamples >> exampleEdgeMarkers [
| v from to edge markers offset|
v := RTView new.
markers := (OPUmlEdgeMarkers selectorsInProtocol: 'markers') select: [ :each | each numArgs isZero ].
offset := 0.
markers
	do: [ :each | 
		from := OPUmlNameLabel new text: each asString.
		to := OPUmlNameLabel new text: each asString.
		(edge := OPUmlEdge new)
			source: from;
			target: to;
			headDecorator: (OPUmlEdgeMarkers perform: each);
			tailDecorator: (OPUmlEdgeMarkers perform: each).
		from renderIn: v.
		to renderIn: v.
		edge renderIn: v.
		from rtElement @ RTDraggable.
		to rtElement @ RTDraggable.
		from translateBy: 0 @ offset.
		to translateBy: 200 @ (offset + 50).
		offset := offset + 50 ].
^ v @ RTEmptyViewContextInteraction
]

{ #category : #icons }
OPUmlShapeExamples >> exampleEdgeMarkersIcon [
	^ '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'
]

{ #category : #sources }
OPUmlShapeExamples >> exampleLabel [
|v el1 el2|
v := RTView new.

el1 := OPUmlNameLabel new
	localStyle: (OPUmlStyle new
		fontBold: true;
		fontItalic: true;
		fontColor: Color red
	);
	text: 'hello'.

el2 := OPUmlNameLabel new
	localStyle: (OPUmlStyle new
		fontUnderline: true;
		fontSize: 15
	);
	text: 'world'.

el1 renderIn: v.
el2 renderIn: v.

RTVerticalLineLayout on: { el1. el2 }.

^ v
]

{ #category : #icons }
OPUmlShapeExamples >> exampleLabelIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABkElEQVR4XuXVMWoCQRiGYe/h
jTyUliIo2NhaaGErVlYuCgoiyBbrOezcRj7DbkKOoAnPC8P8M+U8xXReL7+/VMd/Ah/Ezwfx
Qfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H
8UH8fBA/H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8RPB8njkd9DUXwvH+SDIJNJMh4n
3W6yXCa9Xpo7H+RTINdrcj63CNnvk80mKQofxM8H8UH+W8XPB19VVXyQN1WWZU6nU5rHPx6P
7d6suq4zGAzaebFY+CDvaj6fZzabZb1eZzQaZTgcthBN/X4/0+k0Psgbez6fud/v2e12uVwu
2W637dx0OByyWq1yu918ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/
H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQ
Px+E7QsNuTDG6sO6tgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
OPUmlShapeExamples >> exampleSimpleEdge [
|v from to edge|
v := RTView new.

from := OPUmlNameLabel new text: 'from'.

to := OPUmlNameLabel new text: 'to'.

(edge := OPUmlEdge new)
	source: from;
	target: to;
	headDecorator: RTEmptyNarrowArrow;
	tailDecorator: RTFilledDiamond
	.

from renderIn: v.
to renderIn: v.
edge renderIn: v.

from rtElement @ RTDraggable.
to rtElement @ RTDraggable.

to translateBy: 100 @ 50.

^ v
]

{ #category : #icons }
OPUmlShapeExamples >> exampleSimpleEdgeIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABoElEQVR4XuXXoaoCYRCG4QWv
yevSaDebjAaT1SLYhEXRIILVJBgFBUGs38oxnSvw/GefF+YG5ikzVdP4lVTlr8AH8fNBfBA/
H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQXwQ
Px/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8kK92Pp/jgxTS9XpNr9fLdDrN
YrHIeDzOaDSKD/KHrdfr3O/37Ha7PB6PHA6HD8jr9cpkMslwOIwPUkB1XaeqquZn+v1+fJAC
6na7H5ROp5PT6RQfpLCWy2VrYFp19rYBppV/yH+GafVj+BvmeDzGBymkwWCQ7Xbrg5TSbDbL
ZrNp9vu9D1JSz+cz8/k8l8slPkghrVar3G43H8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQ
Px/EB/HzQXwQPx/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80F8
ED8fxM8H8UH8fBAfxM8H8UH8vtsb0IqClhi/ZT0AAAAASUVORK5CYII='
]

{ #category : #sources }
OPUmlShapeExamples >> exampleSpecialEdgeMarkers [
|v from to edge|
v := RTView new.

from := OPUmlNameLabel new text: 'filledDiamondWith: ''Q'''.
to := OPUmlNameLabel new text: 'emptyDiamondWith:''C'''.

(edge := OPUmlEdge new)
source: from;
target: to;
headDecorator: (OPUmlEdgeMarkers emptyDiamondWith: 'C');
tailDecorator: (OPUmlEdgeMarkers filledDiamondWith: 'Q').

from renderIn: v.
to renderIn: v.
edge renderIn: v.

from rtElement @ RTDraggable.
to rtElement @ RTDraggable.

to translateBy: 200 @ 50.

^ v @ RTEmptyViewContextInteraction 
]

{ #category : #icons }
OPUmlShapeExamples >> exampleSpecialEdgeMarkersIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAADEUlEQVR4XuXYbyuzYRyHcW9k
b8KbUB6pPVjZc+KBJ0pptVjxaJ4oD1YoTYmYZIoo829tpUXtASaNlFptyGhs++72O8tK3d3d
3HVbHccTXLtcD86P03WeZ1ujwa+VauMPAR+EHx+ED8KPD8IH4ccH4YPw44PwQfjxQfjxQfgg
/PggfBB+fBA+CD8+CB+EHx+EHx+ED8KPD8IH4ccH4YPw44PwQfjxQfjxQfgg/PggfBB+fBA+
CD8+CB+EHx+EHx+ED8Lvf4BcXV0pHo/r5eVFH9fK5bLOz8/18PCgP/3u8vKy7u7u3D17e3uf
nnF4eKidnR3ZVz7IF5qamtLQ0JBKpZI6OjoUDodVKBRknZycyOv16vLyUp2dnYrFYlpfX9fs
7KxDHBkZ0cLCgiqVijwej+bn55XJZFQsFnV6euog7Hs+yBeyATw6OtLZ2ZkmJye1trYmmyGL
i4vuLz4ajboBNQwb3GQy6a4fHBwolUrJZtju7m5jZWXFPeft7U0fCD6fT9Vq1eENDw+LD9IC
tbe3KxAINAYGBhr9/f3ig7RAfr9f3d3d6urq0tLSkjY3N92M5IP8UK+vr78dfPvXODMzo3Q6
3Xzn8EFaqA+g4+NjJRIJ8UFaKFvl2ULBltW3t7daXV11QNfX1w4rn8+LD/LD2cpvY2NDW1tb
tpx2M4oP8sPZRnNwcNBtON+X23yQVsj2Nl+5//7+/tP9tVpNfJBvVq/X3UbU3hv2Pnl6elI2
m9Xz87N6eno0NzfnBjeXy2l/f183Nzd6fHxsziC71tvb604U7D5b0dlz7DPbyEYikebmlw/y
F9kZmQ1uKBTSxcWFJiYmmkc475tNjY2NOZy+vj6Nj4+7e+yz7e1t93MwGHTHQdPT0+5ox459
DMSeZ88fHR11R0V8kH/c09iM4K+y+PFB+CD8+CB8EH58ED4IPz4IPz4IH4QfH4QPwo8Pwgfh
xwfhg/Djg/Djg/BB+PFB+CD8+CB8EH58ED4IPz4IPz4IH4QfH4QPwo8Pwgfhxwfhg/Djg/Dj
g/BB+PFB+CD8vt0vqUvbnyI+i+gAAAAASUVORK5CYII='
]

{ #category : #sources }
OPUmlShapeExamples >> exampleUmlColors [
|v builder es colors|
builder := [ :c | | el lbl comp compLbl |
el := OPUmlClassifierShape new.
el sharedStyle fillColor: c; strokeColor: c muchDarker.
lbl := OPUmlNameLabel new.
lbl text: c asString.
lbl localStyle: (OPUmlStyle new fontSize: 11).
lbl owningElement: el.
comp := OPUmlCompartment new.
comp owningElement: el.
(compLbl := OPUmlLabel new)
	owningElement: comp;
	text: 'attr'.
el renderIn: v.
el rtElement when: TRMouseLeftClick do: [ :evt |  ].
el rtElement @ RTResizable @ RTDraggable.
el ].

v := RTView new.

colors := (((Color class methods select: [ :each | each protocol = #defaults ] thenCollect: [ :each |
		each methodClass theNonMetaClass perform: each selector
		]) reject: #isArray) sorted: [:a :b |
			((0.241 * a red) + (0.691 * a green) + (0.068 * a blue)) sqrt
			<
			((0.241 * b red) + (0.691 * b green) + (0.068 * b blue)) sqrt
		]).
	
es := colors collect: [ :each | builder value: each ].

RTGridLayout new on: es.

^ v
]

{ #category : #icons }
OPUmlShapeExamples >> exampleUmlColorsIcon [
	^ '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
TkSuQmCC'
]

{ #category : #accessing }
OPUmlShapeExamples >> label [
	^ 'UML Shapes'
]
