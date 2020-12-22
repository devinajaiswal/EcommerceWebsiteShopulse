<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>


<%@ include file="header.jsp"%>
<br>
<nav aria-label="breadcrumb" role="navigation">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="<c:url value = "/welcome"/>">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Add Product</li>
		</ol>
	</nav>
</nav>
<br>
<div class="col-md-12">
	<div id="feedback">
		<div class="container">
			<div class="col-md-5">
				<div class="form-area">
					<sf:form action="/Ecommerce/prod" modelAttribute="form"
						method="post" enctype="multipart/form-data">
						<sf:hidden path="id" />
						<br style="clear: both">
						<h3 style="margin-bottom: 15px; text-align: left:;">Add Product</h3>
						<b><%@include file="businessMessage.jsp"%></b>
						
						<s:bind path="name">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Name"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						
						<s:bind path="code">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter Code"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						
						<s:bind path="quantity">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter Quantity"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						
						
						<s:bind path="price">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter Price"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						
						<s:bind path="image">
							<div class="form-group">
								<sf:input type="file" path="${status.expression}" placeholder="Enter Image"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						
						<s:bind path="description">
							<div class="form-group">
								<sf:textarea path="${status.expression}" placeholder="Enter Description"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<input type="submit" name="operation"
							class="btn btn-primary pull-right" value="Save">
						<input type="submit" name="operation"
							class="btn btn-primary pull-right" value="Reset">
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--feedback-->
<br>
<div style="margin-top: 147px">
	<%@ include file="footer.jsp"%>
</div>