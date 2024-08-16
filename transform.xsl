<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" />

    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" type="text/css" href="style.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script type="text/javascript" src="?"></script>
                <title>Progetto di Codifica di Testi</title>
            </head>

            <body>
                
                <!-- Header -->
                <div class="header">
                    <a href="https://rassegnasettimanale.animi.it/"><img src="img/logo_rassegna_new.jpg" alt="logoLARASSET" href="https://rassegnasettimanale.animi.it/"/></a>
                    <span id="#sponsor">
                        <a href="https://www.unipi.it/"><img src="https://upload.wikimedia.org/wikipedia/it/e/e2/Stemma_unipi.svg" alt="logoUNIPI"/></a>
                        <h5>
                            <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:sponsor"/>
                        </h5>
                    </span>
                </div>

                <!-- Titolo -->
                <div class="heading">
                    <h2>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h2>
                    <h3>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/> <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[1]"/> e
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[2]"/>
                    </h3>
                </div>

                <!-- Descrizione bibliografica -->
                <div id="desc_bibl">
                    <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc"/>
                </div>

                <!-- Legenda codifica -->
                <div id="legenda_cont">
                    <h2>Legenda</h2>
                    <div id="legenda">
                        <div class="btn_categorie">
                            <button id="persone">Persone</button>
                            <button id="personaggi">Personaggi</button>
                            <button id="bibl">Opere</button>
                            <button id="luoghi">Luoghi</button>
                            <button id="eventi">Eventi</button>
                            <button id="org">Organizzazioni</button>
                            <button id="casa_ed">Casa editrice</button>
                            <button id="date">Date</button>
                            <button id="verbum">Verbum</button>
                            <button id="foreign">Lingua straniera</button>
                            <button id="cit">Citazioni</button>
                            <button id="num">Numeri</button>
                        </div>
                        <div class="btn_interventi">
                            <button id="expan">Espansioni</button>
                            <button id="reg">Regolarizzazioni</button>
                            <button id="ex">Aggiunte</button>
                            <button id="corr">Correzioni</button>
                        </div>
                    </div>
                </div>

                <!-- Testo e facsimili -->
                <div class="testo_cont">
                    <div class="porzione_cont">
                        <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:div[@type='journal']/tei:div">
                            <div class="porzione">
                                <h2> <xsl:value-of select="tei:head"/></h2>
                                <xsl:for-each select="tei:pb">
                                    <xsl:variable name="id_pag">
                                        <xsl:value-of select="@xml:id"/>
                                    </xsl:variable>
                                    <div class="pagina">
                                        <div class="facsimile">
                                            <xsl:apply-templates select="." />
                                        </div>
                                        <table class="colonne">
                                            <tbody>
                                                <tr>
                                                    <th>Colonna 1</th>
                                                    <th>Colonna 2</th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col_sx">
                                                            <xsl:apply-templates select="following-sibling::tei:cb[@corresp=concat('#', $id_pag) and @n=1]" />
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col_dx">
                                                            <xsl:apply-templates select="following-sibling::tei:cb[@corresp=concat('#', $id_pag) and @n=2]" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>

                <!-- Footer -->
                <footer>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[1]"/>,
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[2]"/> <br/>
                    CdL Informatica Umanistica, a.a. 2023/24 <br/>
                    <a href="https://github.com/matildecmp/CdT_2024">Repository GitHub</a> del progetto
                </footer>

            </body>
        </html>
    </xsl:template>

    <!-- Templates specifici -->

    <!-- fileDesc -->
    <xsl:template match="tei:fileDesc">
        <h2>Descrizione bibliografica</h2>
        <table>
            <tr>
                <td> <h3>Pubblicazione</h3> </td>
                <td> <xsl:apply-templates select="tei:publicationStmt"/> </td>
            </tr>
            <tr>
                <td> <h3>Serie</h3> </td>
                <td> <xsl:apply-templates select="tei:seriesStmt"/> </td>
            </tr>
            <tr>
                <td> <h3>Fonte</h3> </td>
                <td> <xsl:apply-templates select="tei:sourceDesc"/> </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <table>
            <tr>
                <td>
                    <strong>Editore</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:publisher"/>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Luogo e data</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:pubPlace"/>, <xsl:value-of select="tei:date"/>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:seriesStmt">
        <table>
            <tr>
                <td>
                    <strong>Serie</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Coordinatore</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:respStmt/tei:name"/>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <table>
            <tr>
                <td>
                    <strong>Titolo</strong>
                </td>
                <td>
                    <em><xsl:value-of select="tei:biblStruct/tei:monogr/tei:title"/></em>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>
                        <xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:resp"/>
                    </strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name[1]"/>,
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name[2]"/>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Editore</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:publisher" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Lingua</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:textLang" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Luogo e data</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace" />,
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:date" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Sezioni codificate</strong>
                </td>
                <td>
                    <xsl:for-each select="tei:biblStruct/tei:analytic">
                        <xsl:choose>
                            <xsl:when test="position() &lt;= 3">
                                <em><xsl:value-of select="tei:title"/></em> <br/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="tei:title"/> <br/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Volume</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[1]"/>
                    <xsl:for-each select="tei:biblStruct/tei:monogr[position() &gt; last() - 2]"> <!-- maggiore dei primi tre titoli, quindi gli ultimi due (Biblio e Notizie) -->
                        <xsl:variable name="volume" select="tei:biblScope[@unit='volume']"/>
                        <xsl:if test="$volume">
                            | <xsl:value-of select="$volume"/>
                        </xsl:if>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Fascicolo</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[2]"/>
                    <xsl:for-each select="tei:biblStruct/tei:monogr[position() &gt; last() - 2]">
                        <xsl:variable name="issue" select="tei:biblScope[@unit='issue']"/>
                        <xsl:if test="$issue">
                            | <xsl:value-of select="$issue"/>
                        </xsl:if>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Pagine</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[3]" />
                    <xsl:for-each select="tei:biblStruct/tei:monogr[position() &gt; last() - 2]"> 
                        <xsl:variable name="page" select="tei:biblScope[@unit='page']"/>
                        <xsl:if test="$page">
                            | <xsl:value-of select="$page"/>
                        </xsl:if>
                    </xsl:for-each>
                    <br/>
                </td>
            </tr>
        </table>
    </xsl:template>

    <!-- Surface -->
    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="alt">Immagine <xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="class">facsimile</xsl:attribute>
        </xsl:element>
    
        <xsl:element name="map">
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:for-each select="tei:zone">
                <xsl:element name="area">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- pb -->
    <xsl:template match="tei:pb">
        <xsl:variable name="pb_id" select="substring-after(@facs, '#')" />
        <xsl:apply-templates select="//tei:facsimile/tei:surface[@xml:id = $pb_id]" />
    </xsl:template>
    
    <!-- cb -->
    <xsl:template match="tei:cb">
        <xsl:variable name="col_id" select="@xml:id"/>
            <xsl:element name="span_col">
                <xsl:attribute name="id">
                    <xsl:value-of select="$col_id"/>
                </xsl:attribute>
            </xsl:element>
        <xsl:apply-templates select="following-sibling::tei:p[@corresp=concat('#', $col_id)] |
                                    following-sibling::tei:ab[@corresp=concat('#', $col_id)] |
                                    following-sibling::tei:head[@corresp=concat('#', $col_id)] |
                                    following-sibling::tei:closer[@corresp=concat('#', $col_id)] |
                                    following-sibling::tei:div/tei:p[@corresp=concat('#', $col_id)] |
                                    following-sibling::tei:div/tei:ab[@corresp=concat('#', $col_id)] |
                                    following-sibling::tei:div/tei:head[@corresp=concat('#', $col_id)]" />
    </xsl:template>
        
    <!-- Head -->
    <xsl:template match="tei:head">
        <div class="paragr">
            <xsl:element name="span">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <strong><xsl:value-of select="@xml:id"/></strong>
            </xsl:element>
            <div class="blocco_testo">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>
    
    <!-- Closer -->
    <xsl:template match="tei:closer">
        <div class="paragr">
            <xsl:element name="span">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <strong><xsl:value-of select="@xml:id"/></strong>
            </xsl:element>
            <div class="blocco_testo">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <!-- p -->
        <xsl:template match="tei:p">
            <div class="paragr">
                <xsl:element name="span">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <strong><xsl:value-of select="@xml:id"/></strong>
                </xsl:element>
                <div class="blocco_testo">
                    <xsl:apply-templates />
                </div>
            </div>
        </xsl:template>
        
    <!-- ab -->
        <xsl:template match="tei:ab">
            <div class="paragr_gener">
                <xsl:element name="span">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <strong><xsl:value-of select="@xml:id"/></strong>
                </xsl:element>
                <div class="blocco_testo">
                    <xsl:apply-templates />
                </div>
            </div>
        </xsl:template>
    
    <!-- lb -->
        <xsl:template match="tei:lb">
            <div class="riga">
                <xsl:apply-templates />
            </div>
        </xsl:template>
    
</xsl:stylesheet>