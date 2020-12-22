<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<%@ include file="header.jsp" %>
<br>
<nav aria-label="breadcrumb" role="navigation"> <nav
		aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/Ecommerce/welcome">Home</a></li>
		<li class="breadcrumb-item"><a href="/Ecommerce/prod/search">Products</a></li>
		<li class="breadcrumb-item active" aria-current="page">Book Product</li>
	</ol>
	</nav>

<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="/Ecommerce/prod/getImage/${prod.id}" /></div>
						  
						</div>
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${prod.name}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<h4 class="price">current price: <span>${prod.price}</span></h4>					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div col-md-5 img-thumbnail">
           <div id="feedback"> <div class="container">
<div class="col-md-5">
    <div class="form-area">  
       <sf:form action="/Ecommerce/bookProd" modelAttribute="form"
						method="post">
        
      <sf:hidden path="id" />
      <sf:hidden path="productId"/>
      <sf:hidden path="userId"/>
      <sf:hidden path="amount"/>
			
        <br style="clear:both">
                    <h3 style="margin-bottom: 15px; text-align: left: ;">Add Detail</h3>
                	 <b><%@include file="businessMessage.jsp"%></b>
        			<div class="form-group">
							<s:bind path="name">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Name"
									class="form-control"  />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
							
								<s:bind path="emailId">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Email Id"
									class="form-control"  />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<s:bind path="mobileNo">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Mobile No"
									class="form-control"  />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<s:bind path="country">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Country"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
							<s:bind path="state">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  State"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
			
						<s:bind path="district">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  District"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						
						<s:bind path="pinCode">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  PinCode"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<s:bind path="quantity">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Quantity"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
						<s:bind path="address">
							<div class="form-group">
								<sf:input path="${status.expression}" placeholder="Enter  Address"
									class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
							</div>
						</s:bind>
			
                    
            
        <input type="submit" name="operation"
								class="btn btn-primary pull-right" value="Payment">
								<input type="submit" name="operation"
								class="btn btn-primary pull-right" value="Reset">
        </sf:form>
    </div>
</div>
</div> </div>

 <!--feedback-->
<br>
<div style="margin-top: 83px">
		<%@ include file="footer.jsp"%>
		</div>