<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
function selectallfromcheckbox(arg){
	if($(arg).prop('checked')==true){
		$('input[name="checkbox"]:enabled').prop("checked",true);
	}else{
		$('input[name="checkbox"]:enabled').prop("checked",false);
	}
}
</script>
<body>
	<table
		class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr>
			<th><input type="checkbox" onclick="selectallfromcheckbox(this)"/></th>
				<th>#</th>
				<th>Item code</th>
				<th>Item name</th>
				<th>Category</th>
				<th>Select All</th>
			</tr>
		</thead>
		<tbody>
			<s:if test="prodList!=null && prodList.size()>0">
				<s:iterator value="prodList" var="pList" status="p">
					<tr>
					    <td><input type="checkbox" name="checkbox" value="<s:property value="productId" />"/></td>
						<td><s:property value="#p.index+1" /></td>
						<td><s:property value="productCode" /></td>
						<td><s:property value="productName" /></td>
						<td><s:property value="category.categoryCode" /></td>
						<td><input type="checkbox" class="form-check-input"
							id="exampleCheck1"></td>
					</tr>
				</s:iterator>
			</s:if>
		</tbody>
	</table>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			<button type="submit" class="btn btn-primary btn-sm">Submit</button>
		</div>
	</div>
</body>
</html>