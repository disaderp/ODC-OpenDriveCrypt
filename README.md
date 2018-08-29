# ODC-OpenDriveCrypt
ODC is a concept to make an afforable and easy to setup for everyone hardware opensource disk encryption module

## disk encryption
> Disk encryption is a technology which protects information by converting it into unreadable code that cannot be deciphered easily by unauthorized people. Disk encryption uses disk encryption software or hardware to encrypt every bit of data that goes on a disk or disk volume. It is used to prevent unauthorized access to data storage.
Expressions full disk encryption (FDE) or whole disk encryption signify that everything on disk is encrypted, but the master boot record (MBR), or similar area of a bootable disk, with code that starts the operating system loading sequence, is not encrypted. Some hardware-based full disk encryption systems can truly encrypt an entire boot disk, including the MBR.
> https://en.wikipedia.org/wiki/Disk_encryption

## software encryption
Software encryption definately protects you (assuming your password has not been compromised) against leaking personal data from stolen computer or curious flatmate.

However one of the disclosed pitfalls of software disk encryption is that the master keys must remain in RAM in order to provide fully transparent encryption.

Knowing the key size and encryption scheme allow to locate keys in memory dumps

[TrueCrypt master key extraction](https://volatility-labs.blogspot.com/2014/01/truecrypt-master-key-extraction-and.html)

It's extremely hard to perform this kind of attack, however the possibility remains.

## ODC encryption
ODC keeps the encrypting device separate from the computer which can be infected and have an internet access.

ODC on the other hand has disabled internet interfaces, serial interface with computer. The only way to interact with the device is with a USB keyboard connected directly to device.

## possible vulnerabilities
* `coldboot attack`
* `evil maid attack`
* the encrypted disk can be also mounted directly on computer using `dm-crypt`, however if you want to be protected against low level exploits, you have to consider the disk compromised.

## differences between using dm-crypt directly on computer and on ODC
* prevents master key extraction from memory on running computer (computer has no knowledge of being encrypted)
* ODC allows `MBR` record encryption
* ODC allows to setup `GUID Partition Table`(`GPT`) as opposed to `TrueCrypt`
* protects against low level exploits on your computer

## behind ODC
ODC uses `dm-crypt` with `LUKS` header

## why ODC
ODC is opensource, everyone can verify the solution. 

## how to buy ODC-device
ODC was originally created on very cheap `OrangePi Zero` board with `NAS shield`, which provides ability to connect `SATA` and `M.2` devices. 

Although it can be installed on any linux based `SoC` that supports `USB OTG` mode and has appropiate kernel module (`g_mass_storage`), for beginners I recommend using `OrangePi Zero` (*it's also very cheap*).

## components
* `OrangePi Zero` (*enough if you want to plug just USB pendrive*)
* `NAS Shield` (*optional, but recommended if you want to plug `SATA` devices*)
* `SD Card` (10 Class preferably)
* `armbian image` [Armbian Stretch](https://www.armbian.com/orange-pi-zero/)
* microUSB -> USB to setup device
* USB keyboard (*absolutely required*)
* USB hub (*useful if you want to use device without `NAS Shield` module*)

## installation guide
1. Install armbian on sdcard
2. Connect USB cable to computer
3. Open serial port monitor (ex. `putty`)
4. `TODO: more info about serial port`
5. Connect the device to internet (ethernet or wifi)
6. `git clone https://github.com/disaderp/ODC-OpenDriveCrypt.git`
7. `cd ODC-OpenDriveCrypt`
8. `chmod +x ODC-setup.sh`
9. `./ODC-setup.sh`
10. Follow the setup instructions


`TBC`
