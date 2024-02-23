<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Quản lý Đặt Lịch Hẹn</li>
			</ul>
			<!-- /.breadcrumb -->

			<div class="nav-search" id="nav-search">
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
				<h1>Quản lý Đặt Lịch Hẹn</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<div class="container">
						<h1>Quản Lý Đặt Lịch Hẹn</h1>
					</div>
					<div id="exTab1" class="container">
						<ul class="nav nav-pills">
							<li class="active"><a href="#1a" data-toggle="tab">KH
									Mới</a></li>
							<li><a href="#2a" data-toggle="tab">KH Thân Thiết</a></li>
							<li><a href="#3a" data-toggle="tab">KH Chờ Khám</a></li>
							<li><a href="#4a" data-toggle="tab">KH Chờ Thanh Toán</a></li>

						</ul>

						<div class="tab-content clearfix">
							<div class="tab-pane active" id="1a">
								<!-- PAGE CONTENT BEGINS -->
								<div class="container">
									<div class="col-xs-8">
										<div class="table-title">
											<div class="row">
												<!-- <div class="col-sm-8">
										<h2>
											Quản lý <b>Tài Khoản</b>
										</h2>
									</div> -->
												<div class="col-sm-12">
													<button type="button" class="btn btn-info add-new">
														<i class="fa fa-plus"></i> Thêm Mới
													</button>
												</div>
											</div>
										</div>
										<table id="simple-table"
											class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th>Mã đặt lịch</th>
													<th class="hidden-480">Họ và tên</th>
													<th class="hidden-480">Điện thoại</th>
													<th>Ngày Giờ</th>
													<th>Ghi chú</th>
													<th>Actions</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${appos }" var="item">
													<tr>
														<td class="center">${item.id }</td>
														<td>${item.patientName }</td>
														<td>${item.phone }</td>
														<td>${item.dateCome}</td>
														<td>${item.symptom }</td>
														<td><a ${hidden } class="add" title="Add" data-toggle="tooltip"><i
																class="material-icons">&#xE03B;</i></a> <a ${hidden } class="edit"
															title="Edit" data-toggle="tooltip"><i
																class="material-icons">&#xE254;</i></a> <a ${hidden } class="delete"
															title="Delete" data-toggle="tooltip"><i
																class="material-icons">&#xE872;</i></a></td>
														<td class="center"><div class="col-xs-3">
																<a ${hidden } href="/staff/createPatient?id=${item.id}">Tạo
																	bệnh nhân</a>
															</div></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>


								<!-- PAGE CONTENT ENDS -->
							</div>
							<div class="tab-pane" id="2a">

								<!-- PAGE CONTENT BEGINS -->
								<div class="container">
									<div class="col-xs-8">
										<div class="table-title">
											<div class="row">
												<!-- <div class="col-sm-8">
										<h2>
											Quản lý <b>Tài Khoản</b>
										</h2>
									</div> -->
												<div class="col-sm-12">
													<button type="button" class="btn btn-info add-new">
														<i class="fa fa-plus"></i> Thêm Mới
													</button>
												</div>
											</div>
										</div>
										<table id="simple-table"
											class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th>Mã đặt lịch</th>
													<th class="hidden-480">Họ và tên</th>
													<th class="hidden-480">Điện thoại</th>
													<th>Ngày Giờ</th>
													<th>Ghi chú</th>
													<th>Actions</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${apposHaveData }" var="item">
													<tr>
														<td class="center">${item.id }</td>
														<td>${item.patient.userDetail.fullname }</td>
														<td>${item.phone }</td>
														<td>${item.dateCome}</td>
														<td>${item.symptom }</td>
														<td><a class="add" title="Add" data-toggle="tooltip"><i
																class="material-icons">&#xE03B;</i></a> <a class="edit"
															title="Edit" data-toggle="tooltip"><i
																class="material-icons">&#xE254;</i></a> <a class="delete"
															title="Delete" data-toggle="tooltip"><i
																class="material-icons">&#xE872;</i></a></td>
														<td class="center"><div class="col-xs-3">
																<a href="/staff/getMedicalRecord?id=${item.id}">Tạo
																	phiếu khám</a>
															</div></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>


								<!-- PAGE CONTENT ENDS -->
							</div>
							<div class="tab-pane" id="3a">
								<!-- PAGE CONTENT BEGINS -->
								<div class="container">
									<div class="col-xs-8">
										<div class="table-title">
											<div class="row">
												<!-- <div class="col-sm-8">
										<h2>
											Quản lý <b>Tài Khoản</b>
										</h2>
									</div> -->
												<div class="col-sm-12">
													<button type="button" class="btn btn-info add-new">
														<i class="fa fa-plus"></i> Thêm Mới
													</button>
												</div>
											</div>
										</div>
										<table id="simple-table"
											class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th>Mã phiếu hẹn</th>
													<th>Số thứ tự</th>
													<th class="hidden-480">Họ và tên</th>
													<th class="hidden-480">Điện thoại</th>
													<th>Ngày khám</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${appoHaveSTT }" var="item">
													<tr>
														<td class="center">${item.id }</td>
														<td>${item.stt}</td>
														<td>${item.patient.userDetail.fullname }</td>
														<td>${item.phone }</td>
														<td>${item.dateCome}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
								<!-- PAGE CONTENT ENDS -->
							</div>
							<div class="tab-pane" id="4a">
								<!-- PAGE CONTENT BEGINS -->
								<div class="container">
									<div class="col-xs-8">
										<div class="table-title">
											<div class="row">
												<!-- <div class="col-sm-8">
										<h2>
											Quản lý <b>Tài Khoản</b>
										</h2>
									</div> -->
												<div class="col-sm-12">
													<button type="button" class="btn btn-info add-new">
														<i class="fa fa-plus"></i> Thêm Mới
													</button>
												</div>
											</div>
										</div>
										<table id="simple-table"
											class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th>Mã Phiếu Hẹn</th>
													<th>Mã Phiếu Khám</th>
													<th class="hidden-480">Tên Khách Hàng</th>
													<th>Bác Sĩ</th>
													<th>Ngày Khám</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${apposGetBill }" var="item">
													<tr>
														<td class="center">${item.id }</td>
														<td>${item.medicalRecord.id }</td>
														<td>${item.patient.userDetail.fullname }</td>
														<td>${item.doctor.userDetail.fullname }</td>
														<td>${item.dateCome}</td>
														<td><a
															href="/staff/createBill?id=${item.id }"
															data-toggle="tooltip">Xuất hóa đơn</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<!-- PAGE CONTENT ENDS -->
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
<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker();
	});
</script>