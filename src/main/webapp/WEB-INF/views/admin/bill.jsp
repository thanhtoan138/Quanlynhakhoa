<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Chi tiết Hóa đơn</li>
			</ul>
			<!-- /.breadcrumb -->

			<div class="nav-search" id="nav-search" >
				<form class="form-search">
					<span class="input-icon"> <input type="text"
						placeholder="Tìm kiếm ..." class="nav-search-input"
						id="nav-search-input" autocomplete="off" /> <i
						class="ace-icon fa fa-search nav-search-icon"></i>
					</span>
				</form>
			</div>
			<!-- /.nav-search -->
		</div>

		<div class="page-content">


			<div class="page-header">
				<h1>
					Chi tiết hóa đơn
					<!-- <small> <i
								class="ace-icon fa fa-angle-double-right"></i> overview &amp;
								stats
							</small> -->
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<div class="container">
						<div class="row">
							<div
								class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<address>
											<strong>KH:
												${bill.medicalRecord.patient.userDetail.fullname }</strong> <br>
											Địa chỉ: ${bill.medicalRecord.patient.userDetail.address } <br>
											<abbr title="Phone">Điện thoại: </abbr>${bill.medicalRecord.patient.userDetail.phone }
										</address>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6 text-right">
										<p>
											<em>Ngày: ${bill.payDate }</em>
										</p>
										<p>
											<em>Biên lai #: ${bill.id }</em>
										</p>
									</div>
								</div>
								<div class="row">
									<div class="text-center">
										<h1>Hóa Đơn</h1>
									</div>

									<table class="table table-hover">
										<thead>
											<tr>
												<th>Dịch vụ</th>
												<!-- <th>Số lượng</th> -->
												<th class="text-center">Đơn vị tính</th>
												<th class="text-center">Đơn Giá</th>
												<!-- <th class="text-center">Thành tiền</th> -->
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${bill.medicalRecord.services }" var="item">
												<tr>
													<td class="col-md-9"><em>${item.serviceName }</em></td>
													<!-- <td class="col-md-1" style="text-align: center">2</td> -->
													<td class="col-md-1 text-center">${item.unit }</td>
													<td class="col-md-1 text-center" id="">${item.price }
													</td>
													<%-- <td class="col-md-1 text-center">$ ${item.price } </td> --%>
												</tr>
											</c:forEach>
											<tr>
												<td> </td>
												<td> </td>
												<td class="text-right"><h4>
														<strong>Tổng chi phí: </strong>
													</h4></td>
												<td class="text-center text-danger"><h4>
														<strong id="tong">$31.53</strong>
													</h4></td>
											</tr>
										</tbody>
									</table>
									<button type="button" class="btn btn-success btn-lg btn-block">
										In biên lại   <span class="glyphicon glyphicon-chevron-right"></span>
									</button>

								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>

	</div>
	<!-- /.main-content -->
</div>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
var tong = 0;
<c:forEach items="${bill.medicalRecord.services }" var="item">
	tong += ${item.price};
</c:forEach>
document.getElementById("tong").textContent = tong;
</script>