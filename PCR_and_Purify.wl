TubeNames = {"oligo_0001", "oligo_0002", "oligo_0003", "oligo_0004", "oligo_0005"};

TubeContents = ConstantArray[Model[Sample, "Milli-Q water"], Length[TubeNames]];

ShipToECL[TubeContents, TubeNames,
 	ContainerModel -> Model[Container, Vessel, "IDT 2ml Skirted Tube"],
 	StorageCondition -> Freezer
 ]

 OrderSamples[
 	Object[Product, "QIAquick PCR Purification Small Kit"], (*Product*)
 	1 (*Quantity*)
 ]



ExperimentScript[
 PreGibsonPCR = ExperimentPCR[
   	Object[Sample, "oligo_0001"],
   	{
    		{{Object[Sample, "oligo_0002"], Object[Sample, "oligo_0003"]}}
    	},
   	MasterMix -> Model[Sample, "DreamTaq PCR Master Mix"],
   	ExtensionTime -> 45 Second,
   	ExtensionTemperature -> 72 Celsius,
   	NumberOfCycles -> 40
   ];
 AmplifiedTemplate = PreGibsonPCR[[1]];
 ExperimentSamplePreparation[
  	{
   		RoboticSamplePreparation[
    			Transfer[
     				Source -> Model[Sample, "QIAquick Buffer PB"],
     				Destination -> 
      Model[Container, Vessel, "1.5mL Tube with 2mL Tube Skirt"],
     				Amount -> 125 Microliter,
     				DestinationLabel -> "Buffer PB and PCR product"
     			],
    			Transfer[
     				Source -> AmplifiedTemplate ,
     				Destination -> "Buffer PB and PCR product",
     				Amount -> 20 Microliter
     			],
    			Mix[
     				Sample -> "Buffer PB and PCR product",
     				Time -> 15 Second
     			]
    		],
   		Filter[
    			Sample -> "Buffer PB and PCR product",
    			Time -> 3 Minute,
    			Intensity -> 1000 GravitationalAcceleration,
    			Filter -> 
     Model[Container, Vessel, Filter, "QIAquick Spin Columns"],
    			Target -> Retentate
    		]
   	}
  ];
 ]
