meta:
  id: ahnenblatt
  file-extension: ahn
  encoding: "utf-8"
  endian: le

types:
  file_magic:
    seq:
      - id: value
        contents: dbk

  sized:
    params:
      - id: type
        type: u1
    seq:
      - id: size
        type: u2
      - id: value
        size: size
        type:
          switch-on: type
          cases:
            201: strz
            202: strz
            203: strz
            204: u2
            206: u2
            207: u2
            208: u1
            209: strz

            192: strz

  attribute:
    seq:
      - id: type
        type: u1
        enum: command
      - id: sized
        type: sized(type.to_i)
        if: type.to_i >= 100

    enums:
      command:
        0: begin_genealogy
        1: end_of_record
        2: begin_software

        # individual persion
        3: begin_individual

        # family, location
        4: begin_other

        0x63: end_of_file

        201: software_author
        202: software_version
        203: submitter
        204: unknown_int1
        206: unknown_int2
        207: unknown_int3
        208: unknown_int4
        209: date_format
        212: unknown_empty1
        213: unknown_empty2
        214: unknown_empty3

        191: dict_item_depth
        192: dict_key
        193: dict_value_as_reference_string
        194: dict_value_literal
        195: dict_value_as_reference_byte
        196: dict_values_as_references_bytes

  record:
    seq:
    - id: attributes
      type: attribute
      repeat: until
      repeat-until: _.type.to_i == 1 or _.type.to_i == 0x63 or attributes.size > 1000

seq:
  - id: file_magic
    type: file_magic

  - id: records
    type: record
    repeat: until
    repeat-until: _.attributes.last.type.to_i == 0x63 or records.size > 1000

