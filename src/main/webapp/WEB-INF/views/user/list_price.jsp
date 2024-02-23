<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-8 text-center heading-section ftco-animate">
				<span class="subheading">Price</span>
				<h2 class="mb-4">Bảng giá</h2>
				<p>Separated they live in. A small river named Duden flows by
					their place and supplies it with the necessary regelialia. It is a
					paradisematic country</p>
			</div>
		</div>

		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">

				<!--Table-->
				<table class="table table-striped">

					<!--Table head-->
					<thead>
						<tr>
							<th class="text-left">Mã dịch vụ</th>
							<th class="text-left">Tên dịch vụ</th>
							<th class="text-left">Đơn vị</th>
							<th class="text-left">Giá tiền (VNĐ)</th>

						</tr>
					</thead>
					<!--Table head-->

					<!--Table body-->
					<%-- <tbody>
						<c:forEach items="${services}" var="item">
							<tr class="table-info">
								<td>${item.id }</td>
								<td>${item.serviceName }</td>
								<td>${item.unit }</td>
								<td>${item.price }</td>
							</tr>
						</c:forEach>
					</tbody> --%>
					<!--Table body-->

					<tbody >
						<c:forEach items="${services}" var="item">
							<tr >
								<td class="text-left">${item.id }</td>
								<td class="text-left">${item.serviceName }</td>
								<td class="text-left">${item.unit }</td>
								<td class="text-left">${item.price }</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<!--Table-->
			</div>
		</div>
	</div>
</section>