(*
 Place this in your list of functions.
Then call from a notebook page using the syntax like this: 
orderLabReadyIDTOligo["ED0022", "gcgaattaatacgactcactatagg", "18698425"] 
*)

orderLabReadyIDTOligo[oligoName_, DNABases_, OrderNumber_] := Module[
  {},
  (*identity model*)
  UploadOligomer[
   	oligoName,
   	Molecule -> Strand[DNA[ToUpperCase[DNABases]]],
   	PolymerType -> DNA
   ];
  (*Fufillment model*)
  UploadSampleModel[
   	oligoName <> " LabReady",
   	Composition -> {
     		{100 Micromolar, Model[Molecule, Oligomer, oligoName]}
     	},
   	State -> Liquid,
   	DefaultStorageCondition -> Model[StorageCondition, "Freezer"],
   	Expires -> False,
   	BiosafetyLevel -> "BSL-1",
   	MSDSRequired -> False
   ];
  DropShipSamples[
   	Model[Sample, oligoName <> " LabReady"],
   	OrderNumber,
   	Provider -> 
    Object[Company, Service, "Integrated DNA Technologies"],
   	Mass -> ProductDocumentation
   ];
  ]