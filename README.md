An asynchronous active low reset FIFO memory controller for a data processing system. The FIFO memory is used to store and retrieve data in a first-in-first-out manner. The controller manages the read and write operations, handle data overflow and underflow conditions, and ensure proper data integrity.

**Requirements:**

The FIFO memory has a depth of 8 memory locations, each capable of storing 8-bit data.

The FIFO memory controller should have separate read and write ports.

The controller should support simultaneous read and write operations, if possible.

When reading from the FIFO, data should be read in the order it was written.

If the FIFO is empty, the reading should be blocked until data is available.

If the FIFO is full, writing should be blocked until space becomes available.

Implement a status signal that indicates when the FIFO is empty and when it is full.

Be sure to handle edge cases, such as reading from an empty FIFO or writing to a full FIFO

Code should be fully parameterized with the parameters of address size and data size

**Schematic diagram:**

![fifoschematic](https://github.com/Filza01/Asynchronous-FIFO-memory-controller/assets/140054781/9a139648-dc60-4e43-a2b0-b14b2eacd72f)

**FSM Diagram:**

![FIFOState](https://github.com/Filza01/Asynchronous-FIFO-memory-controller/assets/140054781/94f7d62a-7556-4750-8a9b-10d2c047333b)

**FIFO Testing:**

The FIFO was tested with folowing testcases:

    high and low reset
    4 writes, 5 reads
    2 reads, 4 writes, 2 reads
    4 writes, 2 reads, 2 writes
    2 writes, 2 reads, 1 write, 1 read
    10 writes, numerous reads
    
**Output Waveforms:**

![Screenshot from 2023-10-12 22-18-47](https://github.com/Filza01/Asynchronous-FIFO-memory-controller/assets/140054781/f274b31b-195e-4bf5-b235-5d7491670298)

![Screenshot from 2023-10-12 22-19-13](https://github.com/Filza01/Asynchronous-FIFO-memory-controller/assets/140054781/6ec23c8b-db4c-4fbe-987f-d81c51cbf7f7)

![Screenshot from 2023-10-12 22-19-52](https://github.com/Filza01/Asynchronous-FIFO-memory-controller/assets/140054781/2175e8b2-f703-4395-a80e-7a9797e22a22)

![Screenshot from 2023-10-12 22-20-37](https://github.com/Filza01/Asynchronous-FIFO-memory-controller/assets/140054781/d0825232-a603-4efe-bb37-26d05413c3df)



