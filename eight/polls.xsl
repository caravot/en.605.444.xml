<?xml version="1.0" encoding="UTF-8" ?>


<xsl:stylesheet version='1.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="4.0"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Election Night Results</title>
                <link href="polls.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <div id="intro">
                    <p>
                        <img src="logo.jpg" alt="Election Day Results"/>
                    </p>
                    <a href="#">Election Home Page</a>
                    <a href="#">President</a>
                    <a href="#">Senate Races</a>
                    <a href="#">Congressional Races</a>
                    <a href="#">State Senate</a>
                    <a href="#">State House</a>
                    <a href="#">Local Races</a>
                    <a href="#">Judicial</a>
                    <a href="#">Referendums</a>
                </div>

                <div id="results">
                    <h1>Congressional Races</h1>

                    <xsl:apply-templates select="polls/race" />
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="race">
        <h2><xsl:value-of select="title" /></h2>
        <table border="0">
            <tr>
                <th>Candidate</th>
                <th class="num">Votes</th>
            </tr>
            <xsl:apply-templates select="candidate"></xsl:apply-templates>
        </table>
    </xsl:template>

    <xsl:template match="candidate">
        <xsl:variable name="percentage" select="votes div sum(..//votes)" />
        <tr>
            <td><xsl:value-of select="name"/> (<xsl:value-of select="party"/>)</td>
            <td class="num">

                <xsl:value-of select="format-number(votes, '#,#00')" />
                (<xsl:value-of select="format-number($percentage, '#,#0%')" />)
            </td>
            <td>
                <xsl:call-template name="showBars">
                    <xsl:with-param name="item" select="round($percentage * 100)" />
                    <xsl:with-param name="party" select="party" />
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="showBars">
        <xsl:param name="item" />
        <xsl:param name="party" />
        <xsl:param name="index" select="1" />

        <xsl:if test="$party = 'D'">
            <span class="blue"><xsl:text>&#160;</xsl:text></span>
        </xsl:if>

        <xsl:if test="$party = 'R'">
            <span class="red"><xsl:text>&#160;</xsl:text></span>
        </xsl:if>

        <xsl:if test="$party = 'I' or $party = 'G' or $party = 'L'">
            <span class="green"><xsl:text>&#160;</xsl:text></span>
        </xsl:if>

        <xsl:if test="$index &lt; $item">
            <xsl:call-template name="showBars">
                <xsl:with-param name="item" select="$item" />
                <xsl:with-param name="party" select="$party" />
                <xsl:with-param name="index" select="$index + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>