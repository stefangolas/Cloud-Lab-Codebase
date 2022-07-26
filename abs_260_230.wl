AbsSpec260230[protocol_] := Module[{},
    data=protocol[Data][[1]]   ;
    ratio = Absorbance[data,260 Nanometer]/Absorbance[data,230 Nanometer];
    Return[ratio];
]