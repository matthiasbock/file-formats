
# Carl Zeiss Imaging data file

* Company: Zeiss
* Software: ZEN and other 3rd-party
* Official name: ZISRAW
* File extension: .czi
* Latest revision: Release Version 1.02 for ZEN 2011
* Base format: Binary with some XML (metadata)
* Contains: Multi-dimensional imaging data with metadata
* Intended for: Advanced microscopy, e.g.:
  * frame/time serieses
  * Z-stacks
  * multi-position experiments

## Format

* Container with header, metadata and "attachments":
  * description of acquisition hardware with fields for:
    * light sources
    * detectors
    * objectives / lenses
    * filters
    * and much more...
  * one or several embedded images
  * settings for image display
* Official format specification available upon registration and approved license request (see link below)

## Open Source support

* Fiji / ImageJ
* python-bioformats
* czifle.py

## Links

* https://www.zeiss.com/microscopy/int/products/microscope-software/zen/czi.html
* https://www.zeiss.de/mikroskopie/produkte/mikroskopsoftware/zen/czi.html
