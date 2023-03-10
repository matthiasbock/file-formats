
# Dymo Connect label

* Purpose: Stores a document to be printed on labels
  * contains objects of different types:
    * text
    * image
    * barcode / QR code
    * lines and shapes
    * etc.
  * with object properties
  * and layout
* Software: Dymo Connect
* Filename extension: .dymo
* Formatting: Human-readable XML
* Official specification: proprietary
* Official API: available

## Links

* https://developers.dymo.com/tag/xml/
* https://stackoverflow.com/questions/73158376/dymo-label-qr-automatically-formats-linked-data-as-website
* https://support.joinhandshake.com/hc/en-gb/articles/360005841133-Name-Tag-XML-Formatting
* https://support.joinhandshake.com/hc/en-gb/articles/6280902909207-Name-Tag-XML-Formatting-for-DYMO-550-or-DYMO-Connect-Software-

~~~xml
<?xml version="1.0" encoding="utf-8"?>
<DesktopLabel Version="1">
  <DYMOLabel Version="3">
    ...
    <DynamicLayoutManager>
      ...
      <LabelObjects>
        ...
        <BarcodeObject>
          ...
          <BarcodeFormat>QRCode</BarcodeFormat>
          ...
          <Size>Large</Size>
          ...
        </BarcodeObject>
      </LabelObjects>
    </DynamicLayoutManager>
  </DYMOLabel>
  ...
</DesktopLabel>
~~~
