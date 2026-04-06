<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
    <title>Cinema Listings</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
    <!-- HEADER -->
    <div class="header">
        <div class="logo">My <span>Cinema</span></div>
        <div class="nav">
            <a href="#">Now Showing</a>
            <a href="#">Coming Soon</a>
        </div>
    </div>

    <div class="container">
        <!-- NOW SHOWING SECTION -->
        <div class="section-box">
            <h2>Now Showing</h2>

            <table class="movie-table">
                <tr>
                    <th>Title</th>
                    <th>Screen</th>
                    <th>Duration</th>
                    <th>Rating</th>
                    <th>Showtimes</th>
                    <th>Price</th>
                    <th>Poster</th>
                </tr>

                <xsl:for-each select="//now_showing/movie">
                <tr>
                    <td>
                        <a href="#desc-{position()}">
                            <xsl:value-of select="title"/>
                        </a>
                    </td>
                    <td><xsl:value-of select="screen"/></td>
                    <td><xsl:value-of select="duration"/></td>
                    <td><xsl:value-of select="rating"/></td>
                    <td>
                        <xsl:for-each select="showtimes/time">
                            <div><xsl:value-of select="."/></div>
                        </xsl:for-each>
                    </td>
                    <td class="price">
                        Adult: <xsl:value-of select="ticket/adult"/><br/>
                        Child: <xsl:value-of select="ticket/child"/>
                    </td>
                    <td>
                        <img src="{image}" width="80"/><br/>
                        <button class="book-btn">Book Now</button>
                    </td>
                </tr>
                </xsl:for-each>
            </table>
        </div>

        <!-- COMING SOON SECTION -->
        <div class="section-box">
            <h2>Coming Soon</h2>

            <table class="movie-table">
                <tr>
                    <th>Title</th>
                    <th>Release Date</th>
                    <th>Rating</th>
                    <th>Poster</th>
                </tr>

                <xsl:for-each select="//coming_soon/movie">
                <tr>
                    <td><xsl:value-of select="title"/></td>
                    <td><xsl:value-of select="release_date"/></td>
                    <td><xsl:value-of select="rating"/></td>
                    <td>
                        <img src="{image}" width="80"/>
                    </td>
                </tr>
                </xsl:for-each>
            </table>
        </div>

        <!-- POPUP DESCRIPTION -->
        <xsl:for-each select="//now_showing/movie">
            <div class="popup" id="desc-{position()}">
                <div class="popup-content">
                    <h2><xsl:value-of select="title"/></h2>
                    <p><xsl:value-of select="description"/></p>
                    <a href="#" class="close-btn">Close</a>
                </div>
            </div>
        </xsl:for-each>

        <!-- FOOTER -->
        <div class="footer">
            <p>2026 My Cinema Website</p>
        </div>
    </div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>