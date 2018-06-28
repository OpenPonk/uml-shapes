running
setUpModel
	| end |
	end := OPUmlLabel new.
	end := OPUmlLabel new.
	(edge := OPUmlEdge new)
		in: [ :e | e localStyle strokeColor: Color blue ];
		source: end;
		target: end.
	end renderIn: view.
	edge renderIn: view.
	model := edge rtEdge