
# Ahnenblatt

- binary file
- UTF-8, little endian encoding
- strings are null-terminated
- begins with a magic string followed by a sequence of records (types see below)
- a record consists of a sequence of entries
- the entries specify attributes to be attached to a record in a procedural manner
- consecutive entries specify field names and values, the latter
  - either as literals or
  - as references to other objects
- the file ends when a special EOF entry is encountered (0x63)

## Record types

* family
* individual
    * may have different types of names, a gender, etc.
* event
    * an event
    * may have a place, a date and links to participants
* source
    * where the respectively annotated information comes from

## Entry structs

* one byte selects the entry type
* if the type value is >= 100, a sized value follows:
  * two bytes encode the size as uint16_t (not counting the size bytes)
  * payload bytes: some entries contain strings, some integers, some are empty

### Entry types

* 0-1: end of record
* 2-4: begin record
* 101-190?: referenceable type
* 192: string; field name
* 193: string; field value as reference ::= '@' ID '@'
* 194: string; field value as literal
* 195: one byte; field value as reference to block type
* 196: multiple bytes; field values as references to block types
* 2xx: header fields?

## Field names

- SUBM: submitter (header: contact)
- ADDR: address (header: contact)
- INDI: An individual's record
    - individual ID ::= 'I' int
    - _UID: unique ID string, length: 36, charset: 0-9, A-F
    - NAME: First name(s); space separated
        - S: birth name
    - SURN: last name
    - GIVN: given name
    - SEX: sex
    - FAMS: spouse as family ID
    - FAMC: is child to family by ID
    - EVEN: an event
        - key: EV
            - BIRT: birth
            - DEAT: death
            - OCCU: occupation
        - DATE: the event's date
        - PLAC: where the event took place
    - CHAN: last change to the record
        - DATE: date of the change
            - TIME: time of the change
- FAM: Family record
    - family ID ::= 'F' int
    - HUSB: the husband's ID
    - WIFE: the wife's ID
    - CHIL: a child's ID (may occur multiple times)
    - EVEN: an event
        - key: EV
            - MARR: marriage
        - PLAC: where the event took place
- OBJE: referencable object
    - object ID ::= 'O' int
    - FILE: path to a file
    - FORM: object format

### TODO

- _LOC
- MAP
    - LATI
    - LONG
- SOUR

## Links

* https://www.ahnenblatt.de/
* https://github.com/rymwid/ahnenblatt
