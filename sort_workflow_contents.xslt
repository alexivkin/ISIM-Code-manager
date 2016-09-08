<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- 
Sorts ITIM workflow contents to simplify diff's between workflows
(C) 2010 Alex Ivkin alex@ivkin.net
-->
<xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="PROCESSDEFINITION">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="PARAMETERS/IN_PARAMETERS">
         <xsl:sort select="@EXTENDED_ATTRIBUTE" data-type="text" order="ascending"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="ACTIVITY">
         <xsl:sort select="@ACTIVITYID" data-type="text" order="ascending"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="TRANSITION">
         <xsl:sort select="@TRANSITIONID" data-type="text" order="ascending"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="RELEVANT_DATA">
         <xsl:sort select="@RELEVANT_DATA_ID" data-type="text" order="ascending"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>