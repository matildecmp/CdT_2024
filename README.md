# TEI-XML encoding of three articles from "La Rassegna Settimanale di politica, scienze, lettere ed arti" (1878-1882)

![TEI](https://img.shields.io/badge/TEI-XML-blue?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA…)
![XML](https://img.shields.io/badge/XML-1.0-orange?logo=xml)

Developed by Matilde Campanardi and Alessandra Caridi</br>
BSc in Digital Humanities [a.y. 2023/24]</br>

# <h3>Validation of the TEI-XML file with Xerces:</h3>
Terminal command:
```bash
.../xerces-2_12_2$ java -cp .:* dom.Counter -v articoli.xml
```

Result:
```bash
articoli.xml: 427;85;2 ms (3642 elems, 8364 attrs, 22198 spaces, 125349 chars)
```

# <h3>Transformation of the TEI-XML file into HTML with the Saxon processor:</h3>
Terminal command:
```bash
.../SaxonHE12-4J$ java -jar saxon-he-12.4.jar -s:articoli.xml -xsl:transform.xsl -o:articoli.html
```


