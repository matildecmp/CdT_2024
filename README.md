# Codifica XML-TEI di tre articoli tratti da "La Rassegna Settimanale di politica, scienze, lettere ed arti" (1878-1882)
Vol.1, fasc.18 | Vol.2, fasc.11 | Vol.2, fasc.16</br>
Realizzata da Matilde Campanardi e Alessandra Caridi</br>
CdL Informatica Umanistica, a.a. 2023/2024</br>

# Validazione del file XML-TEI con Xerces:</br>
Comando da terminale: "$ java -cp .:* dom.Counter -v articoli.xml"</br>
Risultato: "articoli.xml: 737;123;4 ms (3578 elems, 8202 attrs, 21415 spaces, 123865 chars)"</br>

# Trasformazione in file HTML del file XML-TEI + XSLT con il processore Saxon:</br>
Comnando da terminale: "$ java -jar ./SaxonHE12-4J/saxon-he-12.4.jar -s:./SaxonHE12-4J/articoli.xml -xsl:./SaxonHE12-4J/transform.xsl -o:./SaxonHE12-4J/articoli.html"


