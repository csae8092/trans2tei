<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"

    xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- <xsl:param name="col-id"/>
    <xsl:param name="cur-file-id">
        <xsl:value-of select="substring-before(tokenize(base-uri(.), '/')[last()], '.')"/>
    </xsl:param>
    <xsl:variable name="json-location">
        <xsl:value-of select="concat('../trnskrbs_', '3945', '/col/trp.json')"/>
    </xsl:variable>
    <xsl:variable name="json-input" as="xs:string">
        <xsl:value-of select="unparsed-text($json-location)"/>
    </xsl:variable>

    <xsl:variable name="doc-md">
        <xsl:copy-of select="json-to-xml($json-input)//*:map[./*[@key='docId']/text() = $cur-file-id]"/>
    </xsl:variable>

    <xsl:variable name="doc-title">
        <xsl:value-of select="$doc-md//*[@key='title']/text()"></xsl:value-of>
    </xsl:variable> -->

    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <!--<xsl:copy-of select="$doc-md"></xsl:copy-of>-->
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>hansi</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:for-each select=".//page:Page">
                        <tei:pb n="{position()}"/>
                        <xsl:for-each select=".//page:TextRegion">
                            <p>
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="./@id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="./page:TextEquiv/page:Unicode/text()"></xsl:apply-templates>
                            </p>
                        </xsl:for-each>
                    </xsl:for-each>
                </body>
            </text>
        </TEI>

    </xsl:template>
</xsl:stylesheet>
