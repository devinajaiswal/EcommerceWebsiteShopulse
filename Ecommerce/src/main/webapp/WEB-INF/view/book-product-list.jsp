<%@page import="in.co.ecommerce.dao.ProductDAOImpl"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>


<c:url var="addSearch" value="/bookProd/search" />


<%@ include file="header.jsp"%>
<br>
<nav aria-label="breadcrumb" role="navigation">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Book Product</li>
		</ol>
	</nav>
</nav>
<center>
	<h3>Book Product</h3>
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
				<th scope="col">Name</th>
				<th scope="col">ProductName</th>
				<th scope="col">Email Id</th>
				<th scope="col">Mobile No</th>
				<th scope="col">Country</th>
				<th scope="col">State</th>
				<th scope="col">City</th>
				<th scope="col">PinCode</th>
				<th scope="col">Booking Date</th>
				<th scope="col">Address</th>
				<th scope="col">Quantity</th>
				<th scope="col">Amount</th>
				
			</tr>
		</thead>
		<tbody>
 <c:forEach items="${list}" var="bp" varStatus="ct">
			<tr>
				<jsp:useBean id="pr" class="in.co.ecommerce.service.ProductServiceImpl"/>
				

				<td><c:out value="${bp.name}"/></td>
				<td><c:out value="${bp.productName}"/></td>
				<td><c:out value="${bp.emailId}"/></td>
				<td><c:out value="${bp.mobileNo}"/></td>
				<td><c:out value="${bp.country}"/></td>
				<td><c:out value="${bp.state}"/></td>
				<td><c:out value="${bp.district}"/></td>
				<td><c:out value="${bp.pincode}"/></td>
				<td><fmt:formatDate pattern="MM/dd/yyyy"
											value="${bp.date}" /></td>
				<td><c:out value="${bp.address}"/></td>
				<td><c:out value="${bp.quantity}"/></td>
				<td><c:out value="${bp.anmount}"/></td>	
			</tr>
</c:forEach>
		</tbody>
	</table>

	<table>
		<thead>
			<tr>
				<th><input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
					class="btn btn-primary pull-center" value="Previous"></th>
					
					

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