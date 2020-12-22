<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>

<c:url var="addUrl" value="/user" />

<c:url var="addSearch" value="/user/search" />

<c:url var="editUrl" value="/user?id=" />

<%@ include file="header.jsp"%>
<br>
<nav aria-label="breadcrumb" role="navigation">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Customer</li>
		</ol>
	</nav>
</nav>
<center>
	<h3>Customer</h3>
	<b><%@include file="businessMessage.jsp"%></b>
</center>
			<sf:form action="${addSearch}" method="post" modelAttribute="form">

					<sf:input type="hidden" path="id" />

					<sf:input type="hidden" path="pageNo" />
					<sf:input type="hidden" path="pageSize" />

					<sf:input type="hidden" path="listsize" />
					<sf:input type="hidden" path="total" />
					<sf:input type="hidden" path="pagenosize" />

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th><input type="checkbox" id="selectall">Select All</th>
				<th scope="col">Name</th>
				<th scope="col">Email Id</th>
				<th scope="col">Mobile No</th>
				<th scope="col">Edit</th>
			</tr>
		</thead>
		<tbody>
 <c:forEach items="${list}" var="ul" varStatus="ct">
			<tr>
				<td ><input type="checkbox" class="case"
						name="ids" value="${ul.id}"></td>
				<td><c:out value="${ul.firstName}"/> <c:out value="${ul.lastName}"/></td>
				<td><c:out value="${ul.emailId}"/></td>
				<td><c:out value="${ul.mobileNo}"/></td>
				<td><a class="btn btn-success" href="${editUrl}${ul.id}">Edit</a></td>
			</tr>
</c:forEach>
		</tbody>
	</table>

	<table>
		<thead>
			<tr>
				<th><input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
					class="btn btn-primary pull-center" value="Previous"></th>
					
					<th><input type="submit" name="operation" <c:if test="${listsize== 0}">disabled="disabled"</c:if>
					class="btn btn-primary pull-center" value="Delete"></th>
					
					<th><input type="submit" name="operation" 
					class="btn btn-primary pull-center" value="New"></th>

				<th><input type="submit" name="operation" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
					class="btn btn-primary pull-center" value="Next"></th>
			</tr>
		</thead>

	</table>
	
</sf:form>
<br>
<div style="margin-top: 193px">
	<%@ include file="footer.jsp"%>
	</div>