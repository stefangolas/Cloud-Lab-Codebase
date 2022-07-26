ExperimentScript[
poolAmpliconsProtocol = ExperimentSamplePreparation[
	{
		LabelContainer[
			Label -> "Out Gel Extraction Tube",
			Container ->Model[Container,Vessel,"1.5mL Tube with 2mL Tube Skirt"]
		],
		RoboticSamplePreparation[
			(* Create Reaction Mixture *)
			Transfer[
				Source -> Model[Sample,StockSolution,"0.5M EDTA"],
				Destination -> "Out Gel Extraction Tube",
				Amount -> 4Microliter,
				AspirationMix -> True
			],
			Transfer[
				Source -> Object[Container,Plate,"Inner PCR Amplification Plate [22-06-28"],
				Destination -> "Out Gel Extraction Tube",
				Amount -> 15Microliter,
				SourceWell -> {"A1", "A2", "A3", "B1", "B2", "B3"},
				AspirationMix -> True
			]
]
}
];
gelExtractionTube = poolAmpliconsProtocol[Protocols][[2]][ContainersOut];
UploadName[gelExtractionTube, "Gel Extraction Tube (PCR Amplicons) [22-06-28]"];
ExperimentAgaroseGelElectrophoresis[
	{
		gelExtractionTube
	},
	AgarosePercentage -> 2 Percent,
	SampleVolume -> 90 Microliter,
	PeakDetectionRange -> 420 BasePair;;520 BasePair
],
DisplayName -> "Gel Extraction of PCR Amplicons [22-06-28]"
]