
<xsl:stylesheet version='1.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" />

    <xsl:template match="/">
       <html>
       <head>
          <title>SkyWeb Movie Store</title>
          <link href="movie.css" rel="stylesheet" type="text/css" />
       </head>
       <body>
          <h1 id="logo"><img src="skyweb.jpg" alt="SkyWeb" /></h1>
      <br /><br />

          <h1>Hot Movies Collection</h1>

           <xsl:apply-templates select="movies/movie">
           </xsl:apply-templates>
       </body>
       </html>
    </xsl:template>

    <xsl:template match="movie">
        <div>
            <h2><xsl:value-of select="name" /> (<xsl:value-of select="@id" />)</h2>

            <p>
                <img src="{@id}.jpg"></img>
                <xsl:value-of select="description" />
            </p>

            <table border="1">
                <tr>
                    <th>Length</th>
                    <th>Rating</th>
                    <th>Release</th>
                    <th>Language</th>
                    <th>Genre</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="data/length" /></td>
                    <td><xsl:apply-templates select="data/rating" /></td>
                    <td><xsl:apply-templates select="data/release" /></td>
                    <td><xsl:apply-templates select="data/language" /></td>
                    <td><xsl:apply-templates select="data/genre" /></td>
                </tr>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>