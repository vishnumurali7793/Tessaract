<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<table>
		<tr>
			<td colspan="3"><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td colspan="3"><tiles:insertAttribute name="body" /></td>
		</tr>
		<tr>
			<td colspan="3" align=""><tiles:insertAttribute name="footer" /></td>
		</tr>
	</table>
</body>
</html>