
# Programmer Object File (POF)

* Vendor: Altera / Intel
* Software: Quartus-II and others
* Purpose: Stores the bitstream of a programmable logic device alongside some metadata for use by a hardware programming software and device
* Base format: binary

## Structure

POF is a container file format
for programmable logic device configuration data.
It is composed of blocks of data of different types.
The stored data typically includes a CPLD/FPGA bitstream
alongside information about the target device type
and a checksum.

## Known block types

| Block type | Content type | Size | Meaning |
| -- | -- | -- | -- |
| 1 | string | variable | Name of the software that created this file |
| 2 | string | variable | Target device type |
| 3 | string | variable | Project title / Comment |
| 5 | uint16_t | 2 bytes | Encryption / Security bits configuration |
| 8 | uint16_t | 2 bytes | Checksum |
| 17 | uint8_t[] | constant for one device type | Programming data |

## Links

* https://www.intel.com/content/www/us/en/programmable/quartushelp/21.3/index.htm#reference/glossary/def_pof.htm
* https://www.dataman.com/dataman-4848lv48xp48uxp-pof-file-support
* https://www.microchip.com/en-us/products/fpgas-and-plds/spld-cplds/pld-design-resources
* https://github.com/programmable-logic-tools/altera-max-tools/tree/master/src/pof
* http://www.pldtool.com/pld-file-formats
* https://community.intel.com/t5/Programmable-Devices/I-want-knowing-POF-file-format-structures/td-p/74357
  * https://community.intel.com/t5/Programmable-Devices/I-want-knowing-POF-file-format-structures/m-p/74372
  * http://ftp.dataio.com/main/manuals/unifam/translation%20formats.pdf
