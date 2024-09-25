# reisXML
# harjutus 1,2,3,4,5
![pilt](https://github.com/user-attachments/assets/3ff9bf25-7f68-48c3-ad5b-cf9205e82237)
# Harjutus 6
![pilt](https://github.com/user-attachments/assets/a43996ca-0e54-42d5-b848-7fc3fecfb5b8)
# Harjutus 8
![pilt](https://github.com/user-attachments/assets/c97e75fb-02d0-430c-90d8-b0db284abf01)
# from sql to xml
![pilt](https://github.com/user-attachments/assets/e0acfd35-7780-4e49-894b-0ad2a9042ed6)
# mockaroo
![pilt](https://github.com/user-attachments/assets/1295a3c3-ba0a-4560-a8bd-d70e685801fb)
# ülesande selgitamine
![pilt](https://github.com/user-attachments/assets/cd4974a0-80bc-4fdf-8b39-011bf789916e)
***
# KOOD
```markdown
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		<xsl:for-each select="reisid/reis">
			<h1>
				<xsl:value-of select="@lennujaam"/>
			</h1>

			<ul>
				<li>
					<strong>Transport:</strong>
					<xsl:value-of select="reisiinfo/transport"/>
				</li>

				<li>
					<strong>Hinnad:</strong>
					<xsl:choose>
						<xsl:when test="number(translate(hinnad, '$', '')) &gt; 5">
							<span style="background-color: red;">
								<xsl:value-of select="hinnad"/>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<span style="background-color: green;">
								<xsl:value-of select="hinnad"/>
							</span>
						</xsl:otherwise>
					</xsl:choose>
				</li>

				<li>
					<strong>Kontinent:</strong>
					<xsl:value-of select="kontinent"/>
				</li>

				<li>
					<strong>Algus Koht:</strong>
					<xsl:value-of select="reisiinfo/algus_koht"/>
				</li>

				<li style="background-color: yellow;">
					<strong>Lopp Koht:</strong>
					<xsl:value-of select="reisiinfo/lopp_koht"/>
				</li>

				<li>
					<strong>Piletikood:</strong>
					<xsl:value-of select="piletikood"/>
				</li>

				<li>
					<strong>Edasi-tagasi reisi hind:</strong>
					<xsl:value-of select="concat('$', number(translate(hinnad, '$', '')) * 2)"/>
				</li>
			</ul>
		</xsl:for-each>
		<hr></hr>
		<h2>loendades odavate piletite arvu :<xsl:value-of select="count(reisid/reis[number(translate(hinnad, '$', '')) &lt; 5])"/>  </h2>
		<hr></hr>
		<h2>Displaying all XML data in a table with alternating row colors</h2>
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hinnad</th>
				<th>Kontinent</th>
				<th>Algus Koht</th>
				<th>Lopp Koht</th>
				<th>Piletikood</th>
				<th>Edasi-tagasi reisi hind</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<xsl:variable name="rowNumber" select="position()"/>
				<xsl:choose>
					<xsl:when test="$rowNumber mod 2 = 1">
						<tr style="background-color: #f2f2f2;">
							<td>
								<xsl:value-of select="@lennujaam"/>
							</td>
							<td>
								<xsl:value-of select="reisiinfo/transport"/>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="number(translate(hinnad, '$', '')) &gt; 5">
										<span style="background-color: red;">
											<xsl:value-of select="hinnad"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="background-color: green;">
											<xsl:value-of select="hinnad"/>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:value-of select="kontinent"/>
							</td>
							<td>
								<xsl:value-of select="reisiinfo/algus_koht"/>
							</td>
							<td style="background-color: yellow;">
								<xsl:value-of select="reisiinfo/lopp_koht"/>
							</td>
							<td>
								<xsl:value-of select="piletikood"/>
							</td>
							<td>
								<xsl:value-of select="concat('$', number(translate(hinnad, '$', '')) * 2)"/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr style="background-color: #ffffff;">
							<td>
								<xsl:value-of select="@lennujaam"/>
							</td>
							<td>
								<xsl:value-of select="reisiinfo/transport"/>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="number(translate(hinnad, '$', '')) &gt; 5">
										<span style="background-color: red;">
											<xsl:value-of select="hinnad"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="background-color: green;">
											<xsl:value-of select="hinnad"/>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:value-of select="kontinent"/>
							</td>
							<td>
								<xsl:value-of select="reisiinfo/algus_koht"/>
							</td>
							<td style="background-color: yellow;">
								<xsl:value-of select="reisiinfo/lopp_koht"/>
							</td>
							<td>
								<xsl:value-of select="piletikood"/>
							</td>
							<td>
								<xsl:value-of select="concat('$', number(translate(hinnad, '$', '')) * 2)"/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
			



		<hr></hr>
		<h2>Harjutused</h2>
		<h3>Ma olen kaardistanud kõik lennujaamad.</h3>
		<h3>Komponendid kuvatakse märgistatud loeteluna.</h3>
		<h3>Ma värvisin viimase sammu lopp koht kollase taustaga.</h3>
		<h3>Lisasin tingimuse, et kui pileti hind on suurem kui 5, siis on see punane, kui väiksem, siis roheline.</h3>
		<h3>kahekordistas hinna ja sai edasi-tagasi reisi hinna.</h3>
		<h3>H6 tehtud</h3>
	</xsl:template>
</xsl:stylesheet>




