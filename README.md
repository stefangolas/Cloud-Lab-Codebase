# Cloud-Lab-Codebase
This repository provides documentation, example code, and suggestions for Emerald Cloud Lab users. Emerald Cloud Lab is a platform for running molecular biology workflows such as sequencing, PCR, and cloning entirely from your computer. The user specifies their experimental protocol in a Wolfram Language programming environment, and on-site technicians handle the rest using automated lab equipment.

[Check out the Wiki for a more comprehensive description of ECL concepts](https://github.com/stefangolas/Cloud-Lab-Codebase/wiki)

## Concepts
Breakdown of high-level concepts behind ECL

### "Command" functions
"Command" functions are functions that entail physical interaction with the cloud laboratory, and are therefore at the core of every experimental workflow. They always return `Object[...]` values which can be inspected for traceability with `Inspect[Object[...]]`. They also produce effects in the Command Center outside the notebook such as in "Shipments" or "Experiments". The command function distinction does not formally exist in the Command Center (hence quotes) but is practically important for describing a class of functions with unique physical effects.

- **Protocols:** The most common command functions are Protocol-type functions which enact unit operations such as PCR. These return `Object[Protocol, ...]` objects.

- **Transactions:** Another class is Transaction-type functions which entail adding either samples or materials to inventory. These functions are further divided into `ShipToECL[...]`     and `OrderSamples[...]` which pertain to the former and latter cases, respectively.

### Constellation
The constellation is a database for tracking samples, reagents, and other materials. 


### Objects vs. Models
Objects refer to single, discrete instances of a particular type. For instance `Object[Protocol, PCR, "id:01G6nvwJDvmY"]` refers to a single PCR protocol with a unique identity label.

### Protocols vs. Scripts

## Example Code

### PCR_and_Purify.wl
[Here.](../PCR_and_Purify.wl)

Ships samples to ECL and performs a PCR followed by a spin filtration with a Qiagen kit
