<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>

<c:url var="addUrl" value="/prod" />

<c:url var="addSearch" value="/prod/search" />

<c:url var="editUrl" value="/prod?id=" />

<%@ include file="header.jsp"%>
<br>
<nav aria-label="breadcrumb" role="navigation">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/Ecommerce/welcome">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Products</li>
		</ol>
	</nav>
</nav>
<center>
	<b><%@include file="businessMessage.jsp"%></b>
</center>
<hr>
<sf:form action="${addSearch}" method="post" modelAttribute="form">
	<div class="container">
		<h3 class="h3">Products</h3>

		<sf:input type="hidden" path="id" />

		<sf:input type="hidden" path="pageNo" />
		<sf:input type="hidden" path="pageSize" />

		<sf:input type="hidden" path="listsize" />
		<sf:input type="hidden" path="total" />
		<sf:input type="hidden" path="pagenosize" />

		<div class="row">
			
		 <c:forEach items="${list}" var="pd" varStatus="ct">
			<div class="col-md-3 col-sm-6">
				<div class="product-grid4">
					<div class="product-image4">
						<a href="#"> <img class="pic-1" src="/Ecommerce/prod/getImage/<c:out value='${pd.id}'/>">
						</a>


					</div>
					<div class="product-content">
						<h3 class="title">
							<a href="#">${pd.name}</a>
						</h3>
						<div class="price">
							${pd.price} $
						</div>
						<%if(userbean!=null){%>
						<%if(userbean.getRoleId()!=3){ %>
						<a class="add-to-cart" href="/Ecommerce/prod/search?idd=${pd.id}&operation=Delete">Delete</a>
						<a class="add-to-cart"
							href="/Ecommerce/prod?id=${pd.id}">Edit</a>
						<%}else{ %>
						<a class="add-to-cart" href="/Ecommerce/bookProd?pid=${pd.id}">Book</a>
						<%} %>
						<%}else{ %>
						<a class="add-to-cart" href="/Ecommerce/login?pid=${pd.id}">Book</a>
						<%} %>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

</sf:form>
<hr>


<%@ include file="footer.jsp"%>
</body>