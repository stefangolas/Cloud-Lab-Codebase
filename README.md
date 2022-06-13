# Cloud-Lab-Codebase
This repository provides documentation, example code, and suggestions for Emerald Cloud Lab users. Emerald Cloud Lab is a platform for running molecular biology workflows such as sequencing, PCR, and cloning entirely from your computer. The user specifies their experimental protocol in a Wolfram Language programming environment, and on-site technicians handle the rest using automated lab equipment.

[Check out the Wiki for a more comprehensive description of ECL concepts](https://github.com/stefangolas/Cloud-Lab-Codebase/wiki)

## Concepts
Breakdown of high-level concepts behind ECL

### "Command" functions
Command functions are functions that entail physical interaction with the cloud laboratory, and are therefore at the core of every experimental workflow. They almost always return `Object[...]`s which can be inspected for traceability with `Inspect[Object[...]]`. 

#### Protocols
The most common command function is Protocol-type functions which enact unit operations such as PCR. These return `Object[Protocol, ...]` objects.

#### Transactions
Another class is Transaction-type functions which entail adding either samples or materials to inventory. These functions are further divided into ShipToECL 

### Constellation
The constellation is a database for tracking samples, reagents, and other materials. 


### Objects vs. Models
Objects refer to single, discrete instances of a particular type. For instance `Object[Protocol, PCR, "id:01G6nvwJDvmY"]` refers to a single PCR protocol with a unique identity label.

### Protocols vs. Scripts

## Example Code

### PCR_and_Purify.wl
[Here.](../PCR_and_Purify.wl)

Ships samples to ECL and performs a PCR followed by a spin filtration with a Qiagen kit
