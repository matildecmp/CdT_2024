# TEI-XML encoding of three articles from "La Rassegna Settimanale di politica, scienze, lettere ed arti" (1878-1882)

![HTML](https://img.shields.io/badge/HTML-90.9%25-brightgreen)
![XSLT](https://img.shields.io/badge/XSLT-7.2%25-blue)
![CSS](https://img.shields.io/badge/CSS-1.1%25-yellow)
![JavaScript](https://img.shields.io/badge/JavaScript-0.8%25-red)

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

<img width="261" height="152" alt="image" src="https://github.com/user-attachments/assets/95ca31b2-11f9-4825-a934-4a4c7864e535" />

Developed by Matilde Campanardi and Alessandra Caridi</br>
BA in Digital Humanities [a.y. 2023/24]</br>


