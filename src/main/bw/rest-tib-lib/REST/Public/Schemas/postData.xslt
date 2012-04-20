<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="bw tib xsl"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions"
    xmlns:bw="http://windyroad.org/bwunit-0.0.0.xsd" xmlns:bur="http://windyroad.org/rest-tib-lib.xsd" version="2.0">
    <xsl:output omit-xml-declaration="no" />
    <xsl:preserve-space elements="content" />
    <xsl:param name="contentType"/>

    <xsl:template match="/post">
        <bur:post>
            <xsl:variable name="boundary"
                select="concat('--', substring-after($contentType, 'boundary='))" />
            <xsl:variable name="data"
                select="substring-before(.,concat($boundary,'--'))" />               
            <xsl:for-each
                select="tokenize($data, concat($boundary, '.*$'), 'm')[string-length(.)>0]">
                <bur:part>
                    <xsl:variable name="sections"
                        select="tokenize(., '\r?\n\r?\n', 'sm')[string-length(.)>0]" />
                    <xsl:variable name="meta" select="tokenize($sections[1], '(; )|(\r?\n)', 'sm')" />
                    <xsl:for-each select="$meta[string-length(.)>0]">
                        <xsl:variable name="hash" select="tokenize(., '(: )|=')" />
                        <bur:meta name="{$hash[1]}" value="{replace($hash[2], '^&quot;?(.*)&quot;$', '$1')}" />
                    </xsl:for-each>
                    <bur:content>
                        <xsl:value-of select="$sections[2]" />
                    </bur:content>
                </bur:part>
            </xsl:for-each>
        </bur:post>
    </xsl:template>



</xsl:stylesheet>