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
		<li class="breadcrumb-item active" aria-current="page">Payment</li>
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
       <sf:form action="/Ecommerce/bookProd/payment" 
						method="post">
        	
        <br style="clear:both">
                    <h3 style="margin-bottom: 15px; text-align: left: ;">Payment Detail</h3>
                	 <b><%@include file="businessMessage.jsp"%></b>
        			<div class="form-group">
							
			<div class="form-group">
								<input type="text" class="form-control"  name="CName"
									placeholder="Card Holder Name" value="" > 
									
					</div>
        			<div class="form-group">
								<input type="text" class="form-control"  name="CNum"
									placeholder="Card Number "  > 
									
							</div>
							
        					<div class="form-group">
								<input type="text" class="form-control"  name="month"
									placeholder="Month"  > 
									
							</div>

							
							<div class="form-group">
								<input type="text" class="form-control"  name="year"
									placeholder="Year"  > 
									
							</div>
							
							<div class="form-group">
								<input type="text" class="form-control"  name="Cvv"
									placeholder="CVV"  > 
									
							</div>
                    
            
        <input type="submit" name="operation"
								class="btn btn-primary pull-right" value="Confirm Payment">
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