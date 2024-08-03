meta:
  id: ahnenblatt
  file-extension: ahn
  encoding: "utf-8"
  endian: le

types:
  file_magic:
    seq:
      - id: value
        type: strz

  sized:
    types:
      software_author:
        seq:
          - id: value
            type: strz
      software_version:
        seq:
          - id: value
            type: strz
      date_format:
        seq:
          - id: value
            type: strz
      field_name:
        seq:
          - id: value
            type: strz
      field_reference:
        seq:
          - id: value
            type: strz
      field_value:
        seq:
          - id: value
            type: strz
      sibling:
        seq:
          - id: value
            type: strz
    params:
      - id: type
        type: u1
    seq:
      - id: size
        type: u2
      - id: value
        size: size
        # type:
        #   switch-on: type
        #   cases:
        #     # 210: header_unknown1
        #     202: software_version
        #     201: software_author
        #     203: strz # data title
        #     # 204: header_unknown2
        #     # 206: header_unknown3
        #     # 207: header_unknown4
        #     # 208: header_unknown5
        #     209: date_format
        #     # 212: header_unknown7
        #     # 213: header_unknown8
        #     # 214: header_unknown9

        #     # 192: field_bool_unknown1
        #     192: field_name
        #     193: field_reference
        #     # 194: field_comment
        #     195: field_value

        #     181: strz # reference id? date value
        #     182: strz # reference id? time value

        #     # Sibling's first name
        #     112: sibling

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
        1: end_of_record
        2: begin_software

        # individual persion
        3: begin_individual

        # family, location
        4: begin_other

        0x63: end_of_file

        # 210: header_unknown1
        202: software_version
        201: software_author
        203: strz # data title
        # 204: header_unknown2
        # 206: header_unknown3
        # 207: header_unknown4
        # 208: header_unknown5
        209: date_format
        # 212: header_unknown7
        # 213: header_unknown8
        # 214: header_unknown9

        191: dict_item_depth
        192: dict_key
        193: dict_value_as_reference_string
        194: dict_value_literal
        195: dict_value_as_reference_byte
        196: dict_values_as_references_bytes

        # 181: strz # reference id? date value
        # 182: strz # reference id? time value

        # Sibling's first name
        112: sibling

  record:
    seq:
    - id: attributes
      type: attribute
      repeat: until
      repeat-until: _.type.to_i < 2 or _.type.to_i == 0x63

seq:
  - id: file_magic
    type: file_magic

  - id: records
    type: record
    repeat: until
    repeat-until: _.attributes.last.type.to_i == 0x63
