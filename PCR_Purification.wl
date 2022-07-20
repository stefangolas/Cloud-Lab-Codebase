InputSample = Model[Sample, "Milli-Q water"]

ExperimentFilter["input sample",(*already contains sample and PB \buffer*)(*centrifuge and filter*)
    Intensity -> 1000 GravitationalAcceleration, 
    Filter -> Model[Container, Vessel, Filter, "QIAquick Spin Columns"],(*retentate wash options have nested index matching and we'll save the second flow-through*)
    RetentateWashBuffer -> {{Model[Sample, "QIAquick Buffer PE"], Model[Sample, "QIAquick Buffer EB"]}}, 
    RetentateWashVolume -> {{700 Microliter, 50 Microliter}}, 
    WashFlowThroughContainerLabel -> {{"wash", "elution"}}, 
    NumberOfRetentateWashes -> {{2,    1}},(*sample prep where we add PB buffer to sample before \starting filtration.NOTE:The volume CANNOT exceed max volume of \filter,which is set to 0.7 mL*)
    PreparatoryUnitOperations -> 
        {LabelContainer[
            Label -> "Sample Container", 
            Container -> Model[Container, Vessel, "1.5mL Tube with 2mL Tube Skirt"]
            ], 
        Transfer[
            Source -> InputSample,(*this would be your actual sample*)
            Destination -> "Sample Container", 
            Amount -> 100 Microliter, 
            DestinationLabel -> "input sample"
            ], 
        Transfer[Source -> Model[Sample, "QIAquick Buffer PB"], 
            Destination -> "input sample", 
            Amount -> 600 Microliter
            ]
        }
    ]