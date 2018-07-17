<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Used Vehicles</title>
      </head>
      <style type="text/css">
        tr.green td { color: green; font-weight: bold; }
      </style>
      <body background="money.jpg">
        <h1 style="background-color:#446600;
          color:#FFFFFF; font-size:20pt; text-align:center;
          letter-spacing: 12pt">Used Vehicles</h1>

        <table border="1" align="center">
          <tr>
            <th>Year</th>
            <th>Make</th>
            <th>Model</th>
            <th>Mileage</th>
            <th>Color</th>
            <th>Price</th>
            <th>CARFAX</th>
          </tr>
          <xsl:apply-templates select="vehicles/vehicle">
            <xsl:sort select="price" />
          </xsl:apply-templates>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td colspan="2" style="font-weight: bold;">Average Price: </td>
            <td style="font-weight: bold;">
              $<xsl:value-of select="round(sum(/vehicles/vehicle/price) div count(/vehicles/vehicle))"/>
            </td>
            <td></td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="vehicle">
    <tr>
      <xsl:attribute name="class">
        <xsl:if test=" mileage &lt; 20000 and carfax/@buyback = 'yes' ">
          green
        </xsl:if>
      </xsl:attribute>

      <td>
        <xsl:apply-templates select="@year" />
      </td>
      <td><xsl:apply-templates select="@make" /></td>
      <td><xsl:apply-templates select="@model" /></td>
      <td><xsl:apply-templates select="mileage" /></td>
      <xsl:apply-templates select="color" />
      <xsl:apply-templates select="price" />
      <xsl:apply-templates select="carfax" />
    </tr>
  </xsl:template>

  <xsl:template match="price">
    <td>$<xsl:value-of select="." /></td>
  </xsl:template>

  <xsl:template match="color">
    <td style="background-color: {.};"></td>
  </xsl:template>

  <xsl:template match="carfax">
    <td align="center">
      <xsl:if test=" @buyback = 'yes' ">
        <img src="checkmark.gif"/>
      </xsl:if>
    </td>
  </xsl:template>
</xsl:stylesheet>
