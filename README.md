# huawei-storage-sim

This repository shows how Huawei Storage can be managed via REST by using a Huawei Storage Simulator.

## Installation
* Download the [Huawei Storage Simulator](http://support.huawei.com/enterprise/en/tool/storage-simulator-TL1000000114/TV1000000063). It simulates a Huawei OceanStore S5600T
* Start the Simulator
* Get the official REST API Reference. I used the API Reference of the a [Huawei OceanStor 5600 V3](http://support.huawei.com/enterprise/en/enterprise-storage/oceanstor-5600-v3-pid-21041235?category=api-documentation)
* Use the PowerShell Script to test against the simulator. The current script simply lists all existing LUNs. The initial state of the simulator contains neither Pools nor LUNs.
