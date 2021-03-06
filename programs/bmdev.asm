; =============================================================================
; BareMetal -- a 64-bit OS written in Assembly for x86-64 systems
; Copyright (C) 2008-2013 Return Infinity -- see LICENSE.TXT
;
; Include file for Bare Metal program development (API version 2.0)
; =============================================================================


b_output		equ 0x0000000000100010	; Displays text. IN: RSI = message location (zero-terminated string)
b_output_chars		equ 0x0000000000100020	; Displays a number of characters. IN: RSI = message location, RCX = number of characters
b_input			equ 0x0000000000100030	; Take string from keyboard entry. IN: RDI = location where string will be stored. RCX = max chars to accept
b_input_key		equ 0x0000000000100040	; Scans keyboard for input. OUT: AL = 0 if no key pressed, otherwise ASCII code
b_smp_enqueue		equ 0x0000000000100050	; Add a workload to the processing queue. IN: RAX = Code to execute, RBX = Variable/Data to work on
b_smp_dequeue		equ 0x0000000000100060	; Dequeue a workload from the processing queue. OUT: RAX = Code to execute, RBX = Variable/Data to work on
b_smp_run		equ 0x0000000000100070	; Call the function address in RAX. IN: RAX = Memory location of code to run
b_smp_wait		equ 0x0000000000100080	; Wait until all other CPU Cores are finished processing.
b_mem_allocate		equ 0x0000000000100090	; Allocates the requested number of 2 MiB pages. IN: RCX = Number of pages to allocate. OUT: RAX = Starting address, RCX = Number of pages allocated (Set to the value asked for or 0 on failure)
b_mem_release		equ 0x00000000001000A0	; Frees the requested number of 2 MiB pages. IN: RAX = Starting address, RCX = Number of pages to free. OUT: RCX = Number of pages freed
b_ethernet_tx		equ 0x00000000001000B0	; Transmit a packet via Ethernet. IN: RSI = Memory location where data is stored, RDI = Pointer to 48 bit destination address, BX = Type of packet (If set to 0 then the EtherType will be set to the length of data), CX = Length of data
b_ethernet_rx		equ 0x00000000001000C0	; Polls the Ethernet card for received data. IN: RDI = Memory location where packet will be stored. OUT: RCX = Length of packet
b_file_read		equ 0x00000000001000D0	; Read a file from disk into memory. IN: RSI = Address of filename string, RDI = Memory location where file will be loaded to. OUT: Carry is set if the file was not found or an error occured
b_file_write		equ 0x00000000001000E0	; Write memory to a file on disk. IN: RSI = Memory location of data to be written, RDI = Address of filename string, RCX = Number of bytes to write. OUT: Carry is set if an error occured
b_file_create		equ 0x00000000001000F0	; Create a file on disk. IN: RSI = location of filename, RCX = number of 2MiB blocks to reserve
b_file_delete		equ 0x0000000000100100	; Delete a file from disk. IN: RSI = Memory location of file name to delete. OUT: Carry is set if the file was not found or an error occured
b_file_query		equ 0x0000000000100110	; Query the existence of a file. IN: RSI = location of filename. OUT: RCX = Size in bytes, Carry set if file not found
b_file_list		equ 0x0000000000100120	; Generate a list of files on disk. IN: RDI = Location to store list. OUT: RDI = pointer to end of list
b_system_config		equ 0x0000000000100130	; Info pending!

; =============================================================================
; EOF
