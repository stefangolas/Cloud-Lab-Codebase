# Cloud-Lab-Codebase
This repository provides documentation, example code, and suggestions for Emerald Cloud Lab users. Emerald Cloud Lab is a platform for running molecular biology workflows such as sequencing, PCR, and cloning entirely from your computer. The user specifies their experimental protocol in a Wolfram Language programming environment, and on-site technicians handle the rest using automated lab equipment.

[Check out the Wiki for a more comprehensive description of ECL concepts](https://github.com/stefangolas/Cloud-Lab-Codebase/wiki)

## Concepts
Breakdown of high-level concepts behind ECL

### "Command" functions
"Command" functions are functions that entail physical interaction with the cloud laboratory, and are therefore at the core of every experimental workflow. They always return `Object[...]` values which can be inspected for traceability with `Inspect[Object[...]]`. They also produce effects in the Command Center outside the notebook such as in the "Shipments" or "Experiments" tabs. The command function distinction does not formally exist in the Command Center (hence quotes) but is practically important for describing a class of functions with unique physical effects.

- **Protocols:** The most common command functions are Protocol-type functions which enact unit operations such as PCR. These return `Object[Protocol, ...]` objects. Every experimental workflow involves protocol functions at the unit-level. In most cases the return value will contain a `SamplesOut` field accessible via `Object[Protocol, ...][SamplesOut]`.

- **Transactions:** Another class of command functions are Transaction-type functions which entail adding either samples or materials to inventory. These functions are further divided into `ShipToECL[...]` and `OrderSamples[...]` which pertain to the former and latter cases, respectively.

### Constellation
The constellation is a database for tracking samples, reagents, and other materials, as well as data such as protocols for tracking sample history.


### Objects vs. Models
Objects refer to single, discrete instances of a particular type. For instance `Object[Protocol, PCR, "id:01G6nvwJDvmY"]` refers to a single PCR protocol with a unique identity label.

### Protocols vs. Scripts
While protocols are unit-level functions with specific arguments, a script is a wrapper that enables the sequential execution of multiple protocols, with variable assignment to direct samples from one operation to the next. Scripts are defined with the `ExperimentScript[...]` function, with protocols separated by semi-colons passed as arguments. See [this example](../PCR_and_Purify.wl) for details.

### ExperimentSamplePreparation
This is a function composed of several child functions called unit ops arranged as a list such that the signature is `ExperimentSamplePreparation[{..}]`. This can be a confusing function because it can return either a Protocol object or a Script object depending on whether all of the Unit Ops are robotic (in which case it is a protocol) or not (in which case it is a script). Unit ops are very similar to protocols, and in many cases have protocol counterparts. They are distinguished from their counterparts by the lack of an Experiment prefix, e.g. `ExperimentFilter[...]` will be a protocol and `Filter[...]` will be a unit op, but they will have the exact same parameters. The choice of usage depends on the context, i.e. a unit op will only be used in `ExperimentSamplePreparation[{..}]`. Unit ops are separated by commas in their parent function signature.

## Example Code

### PCR_and_Purify.wl
[Here.](../PCR_and_Purify.wl)

Ships samples to ECL and performs a PCR followed by a spin filtration with a Qiagen kit
