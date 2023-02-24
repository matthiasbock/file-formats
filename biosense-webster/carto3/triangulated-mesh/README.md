
## Biosense Webster CARTO3 Triangulated Mesh file format

* human-readable ASCII
* ini-style syntax:
  * header with magic string
  * sections in brackets: []
  * within sections: one value assignment per line
  * target value + "=" + assigned value + "\n"
  * arbitrary amount of whitespace between beginning of a line, variable name, operators and literals
  * lines beginning with a colon are comments

### Header

~~~
#TriangulatedMeshVersion2.0
; Biosense Webster Triangulated Mesh file format, 2008
; Rights Biosense Webster, LTD
; http://www.biosensewebster.com
~~~

### [GeneralAttributes]

~~~
MeshID = <integer>
MeshName = <string>
NumVertex = <integer>
NumTriangle = <integer>
TopologyStatus = <integer>
MeshColor = <4x <float>>
Matrix = <16x <float>>
NumVertexColors = <integer>
~~~

### [VerticesSection]

~~~
<vertex> ::= <vertex_number> '=' <x> <y> <z> <normal_x> <normal_y> <normal_z> <group_id>
<x>, <y>, <z>, <normal_x>, <normal_y>, <normal_z> ::= <float>
<group_id> ::= <integer>
~~~

### [VerticesAttributesSection]

### [TrianglesSection]

~~~
<triangle> ::= <triangle_number> '=' <vertex1> <vertex2> <vertex3> <normal_x> <normal_y> <normal_z> <group_id>
<vertex1>, <vertex2>, <vertex3> ::= <integer>
~~~
