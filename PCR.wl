TubeNames = {"oligo_0001", "oligo_0002", "oligo_0003", "oligo_0004", "oligo_0005"};

TubeContents = ConstantArray[Model[Sample, "Milli-Q water"], Length[TubeNames]];

ShipToECL[TubeContents, TubeNames,
 	ContainerModel -> Model[Container, Vessel, "IDT 2ml Skirted Tube"],
 	StorageCondition -> Freezer
 ];



ExperimentPCR[
   	Object[Sample, "oligo_0001"], (*Template*)
   	{
    		{{Object[Sample, "oligo_0002"], Object[Sample, "oligo_0003"]}} (*Forward, Reverse*)
    	},
   	MasterMix -> Model[Sample, "DreamTaq PCR Master Mix"],
   	ExtensionTime -> 45 Second,
   	ExtensionTemperature -> 72 Celsius,
   	NumberOfCycles -> 40
   ];


