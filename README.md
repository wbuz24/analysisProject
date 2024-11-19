# IoT Security & Privacy Class Project 2024

Fall 2024 IoT Security & Privacy course by Will Buziak & Cassandra Routsis

The original idea for the project was to snoop on card access scanners, very similar to the ones seen in office buildings and campus dorm rooms. But unfortunately due to issues getting the devices necessary to perform the project we had to pivot to an analysis of [pre-gathered data](https://github.com/juliankaroliny/InSecTT_BLE_Channel_Sniff_Dataset).

## The Dataset

The dataset consists of two sets, collected from the [HackRF](https://greatscottgadgets.com/hackrf/one/) & the [Ubertooth One](https://greatscottgadgets.com/ubertoothone/), both from Great Scott Gadgets. Both datasets snoop on a collection of six [Nordic NRF52840](https://www.nordicsemi.com/Products/nRF52840) devices, all built around a 32 bit ARM cpu employing the ARM TrustZone Trusted Execution Environment.