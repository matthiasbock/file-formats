
# Biosense Webster Carto3 type definition syntax

* Vendor: Biosense Webster
* Software: Carto3
* Encoding: ASCII
* Readability: human-readable with the exception of unexplained abbreviations

## Syntax

* multiple type definitions are allowed per file
* types are defined as type name and base type
* type group is comprised of items
* items are defined as item name, base type and default value

## Example

~~~
!type		CONTACT-FORCE-CALCULATED-VAR	kind=group
.item		baseData			type=CONTACT-FORCE-CALCULATED	default=none
.item		graphData			type=CONTACT-FORCE-CALCULATED	default=none
.item		nonGraphData			type=CONTACT-FORCE-CALCULATED	default=none
.item		CFTemperature			type=float			default=0
.item		FI				type=float			default=0
.item		SPI				type=float			default=0
~~~
