# Codifica XML-TEI di tre articoli tratti da "La Rassegna Settimanale di politica, scienze, lettere ed arti" (1878-1882)
Vol.1, fasc.18 | Vol.2, fasc.11 | Vol.2, fasc.16</br>
Realizzata da Matilde Campanardi e Alessandra Caridi</br>
CdL Informatica Umanistica, a.a. 2023/2024</br>

# <h3>Validazione del file XML-TEI con Xerces:</h3>
Comando da terminale:
```bash
.../xerces-2_12_2$ java -cp .:* dom.Counter -v articoli.xml
```

Risultato:
```bash
articoli.xml: 427;85;2 ms (3642 elems, 8364 attrs, 22198 spaces, 125349 chars)
```

# <h3>Trasformazione in file HTML del file XML-TEI + XSLT con il processore Saxon:</h3>
Comando da terminale:
```bash
.../SaxonHE12-4J$ java -jar saxon-he-12.4.jar -s:articoli.xml -xsl:transform.xsl -o:articoli.html
```


