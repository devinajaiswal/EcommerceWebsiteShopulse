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
			<li class="breadcrumb-item active" aria-current="page">Login</li>
		</ol>
	</nav>
</nav>
<br>
<div class="col-md-12">
	<div id="feedback">
		<div class="container">
			<div class="col-md-5">
				<div class="form-area">
					<sf:form action="/Ecommerce/login" modelAttribute="form"
						method="post">
						<br style="clear: both">
						<h3 style="margin-bottom: 15px; text-align: left:;">Login</h3>
						<b><%@include file="businessMessage.jsp"%></b>
						<s:bind path="login">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter Login"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<s:bind path="password">
							<div class="form-group">
								<sf:input type="password" path="${status.expression}"
									placeholder="Enter Password" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<input type="submit" name="operation"
							class="btn btn-primary pull-right" value="SignIn">
						<input type="submit" name="operation"
							class="btn btn-primary pull-right" value="SignUp">
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