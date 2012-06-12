<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

    <xsl:template match="tokenize">
	<root>
            <xsl:for-each select="tokenize(string,pattern)">
                <output>
                    <xsl:value-of select="."/>
                </output>
            </xsl:for-each>
	</root>
    </xsl:template>

    <xsl:template match="replace">
	<root>
            <xsl:for-each select="replace(string,pattern,replace)">
                <output>
                    <xsl:value-of select="."/>
                </output>
            </xsl:for-each>
	</root>
    </xsl:template>

</xsl:stylesheet>