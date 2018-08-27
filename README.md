# ODC-OpenDriveCrypt
opensource disk encryption hardware module

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
ODC keeps the encrypting device separate from the computer which can be infected, have internet access.

ODC on the other hand has disabled internet interfaces, serial interface with computer. The only way to interact with the device is with a USB keyboard connected directly to device.

## possible vulnerabilities
ODC is prone to cold-boot attack

## behind ODC
ODC uses dm-crypt with LUKS

## why ODC
ODC is opensource, everyone can verify the solution. 

## how to buy ODC-device
ODC was originally created on very cheap OrangePi Zero board with NAS shield, which provides ability to connect SATA devices. 

However it can be installed on any linux based SoC.

## components
* OrangePi Zero
* NAS Shield (*optional*)
* SD Card (10 Class preferably)
* armbian image [Armbian Stretch](https://www.armbian.com/orange-pi-zero/)
* microUSB -> USB to setup device

## installation guide
...
