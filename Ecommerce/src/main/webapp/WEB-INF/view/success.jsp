<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<%@ include file="header.jsp" %>
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
							 <b><%@include file="businessMessage.jsp"%></b>
						</div>
						<h4 class="price">Total Price: <span>${prod.price}</span></h4>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top: 100px">
<%@ include file="footer.jsp" %>