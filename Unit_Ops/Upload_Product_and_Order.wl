UploadMolecule[
 	"2-Methoxy-5-(tetramethyl-1,3,2-dioxaborolan-2-yl)benzaldehyde",
 	BiosafetyLevel -> "BSL-1",
 	IncompatibleMaterials -> {
   		None
   	}
 ]

 UploadSampleModel[
 	"2-Methoxy-5-(tetramethyl-1,3,2-dioxaborolan-2-yl)benzaldehyde",
 	Composition -> {
   		{98 MassPercent, Model[Molecule, "2-Methoxy-5-(tetramethyl-1,3,2-dioxaborolan-2-yl)benzaldehyde"]},
   		{2 MassPercent, Null}
   	},
 	State -> Solid,
 	DefaultStorageCondition ->  Model[StorageCondition, "Ambient Storage"],
 	Expires -> False,
 	MSDSRequired -> False,
 	BiosafetyLevel -> "BSL-1",
 	IncompatibleMaterials -> {
   		None
   	}
 ]

ProductDefinition = UploadProduct[
    ProductModel -> Model[Sample, "2-Methoxy-5-(tetramethyl-1,3,2-dioxaborolan-2-yl)benzaldehyde"], 
    CatalogDescription -> "2-Methoxy-5-(tetramethyl-1,3,2-dioxaborolan-2-yl)benzaldehyde", Supplier -> Object[Company, Supplier, "Ambeed"], 
    CatalogNumber -> "A469180", 
    ProductURL -> "https://ambeed.com/products/866546-13-6.html", 
    Packaging -> Single, SampleType -> Item, NumberOfItems -> 1, 
    Amount -> 71 Gram, Price -> 56 USD, 
    Name -> "2-Methoxy-5-(tetramethyl-1,3,2-dioxaborolan-2-yl)benzaldehyde"]

OrderSamples[ProductDefinition, 1]