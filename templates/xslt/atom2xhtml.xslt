<?xml version="1.0"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xhtml="http://www.w3.org/1999/xhtml"
        xmlns:atom="http://www.w3.org/2005/Atom"
        xmlns="http://www.w3.org/1999/xhtml"
        version="1.0">

    <xsl:import href="html5.xslt"/>
 
    <xsl:key name="entry-by-category" match="atom:entry" use="atom:category[1]/@term" />

    <xsl:template match="/atom:feed">
       <html>
                <head>
                    <title><xsl:value-of select="atom:title" /></title>
                    <link rel="Stylesheet" href="style.css"/>
                </head>
                <body id="feed">
                  <h2>Buyers</h2>
                  Total sales: <xsl:value-of select="count(atom:sale)"/>
                  <xsl:apply-templates select="atom:sale">
                  </xsl:apply-templates>
                </body>
            </html>
    </xsl:template>

    <xsl:template match="atom:sale">
    <div class="buyers" style="border-bottom:1px solid black;border-top:1px solid black">
          Name: <h2><xsl:value-of select="atom:name"/></h2><br/>
          Age: <xsl:value-of select="atom:age"/><br/>
          Sale: <xsl:value-of select="atom:medicament"/><br/>
    </div>
    </xsl:template>

</xsl:stylesheet>