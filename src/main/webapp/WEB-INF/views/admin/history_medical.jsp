<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Phiếu Khám</li>
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
				<h1>
					Phiếu Khám
					<!-- <small> <i
								class="ace-icon fa fa-angle-double-right"></i> overview &amp;
								stats
							</small> -->
				</h1>
			</div>
			<!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="container">
						<div class="col-xs-5">
							<!-- <div class="table-title">
								<div class="row">
									<div class="col-sm-8">
										<h2>
											Quản lý <b>Tài Khoản</b>
										</h2>
									</div>
									<div class="col-sm-12">
										<button type="button" class="btn btn-info add-new">
											<i class="fa fa-plus"></i> Thêm Mới
										</button>
									</div>
								</div>
							</div> -->
							<div class="col-xs-12 col-sm-9 ">
								<table id="simple-table"
									class="table  table-bordered table-hover">
									<thead>
										<tr>
											<td colspan="3"><input required="required" form="filter" name="startDate"
												type="date" value=""><span class="grey">Từ:</span> <input
												form="filter" name="endDate" type="date" required="required" value=""><span
												class="grey">Đến:</span>
												<div>
													<div class="row">

														<!-- /.span -->
														<div class="col-sm-6">
															<span class="pull-right inline"> <span
																class="grey">style:</span> <span
																class="btn-toolbar inline middle no-margin"> <span
																	id="chosen-multiple-style" data-toggle="buttons"
																	class="btn-group no-margin"> <label
																		class="btn btn-xs btn-yellow active"> 1 <input
																			type="radio" value="1" />
																	</label> <label class="btn btn-xs btn-yellow"> 2 <input
																			type="radio" value="2" />
																	</label>
																</span>
															</span>
															</span>
														</div>
														<!-- /.span -->
													</div>
													<div class="space-2"></div>
													<select class="chosen-select form-control"
														id="form-field-select-4" name="patienId"
														data-placeholder="Choose a Phone..." form="filter">
														<c:forEach items="${pantienList }" var="item">
															<option value="${item.id }" selected="selected">${item.userDetail.phone }</option>
														</c:forEach>
													</select>
												</div></td>

											<td><form id="filter" action="/doctor/PatientHistoryMedical" method="post">
													<button type="submit">Tìm</button>
												</form></td>
										</tr>
										<tr>
											<th class="hidden-480">Mã phiếu</th>
											<th class="hidden-480">Họ và tên</th>
											<th class="hidden-480">Điện thoại</th>
											<th class="center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${appos }" var="item">
											<tr>
												<td>${item.id}</td>
												<td>${item.patient.userDetail.fullname}</td>
												<td>${item.patient.userDetail.phone}</td>
												<td class="center">
													<form action="/doctor/ReadMedicalRecord" method="POST">
														<input name="id" type="hidden" value="${item.id }">
														<button type="submit" class="btn btn-minier btn-yellow">Chi
															tiết</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title">Thông tin</h4>
									<!-- <span class="widget-toolbar"> <a href="#"
										data-action="settings"> <i class="ace-icon fa fa-cog"></i>
									</a> <a href="#" data-action="reload"> <i
											class="ace-icon fa fa-refresh"></i>
									</a> <a href="#" data-action="collapse"> <i
											class="ace-icon fa fa-chevron-up"></i>
									</a> <a href="#" data-action="close"> <i
											class="ace-icon fa fa-times"></i>
									</a>
									</span> -->
								</div>
								<div class="widget-body">
									<div class="widget-main">
										<input name="id" type="text" hidden=""
											value="${appoSelete.id}">
										<div class="form-group">
											<label for="exampleForm2">Tên Bệnh Nhân</label> <input
												value="${appoSelete.medicalRecord.patient.userDetail.fullname}"
												name="fullname" type="text" id="exampleForm2"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="exampleForm2">Ngày Khám Bệnh</label>
											<div class='input-group'>
												<input type="datetime-local" class="form-control"
													value="${appoSelete.medicalRecord.examinationDate}"
													name="examinationDate" />
											</div>
										</div>
										<div class="form-group">
											<label for="exampleForm2">Ngày Tái Khám</label>
											<div class='input-group'>
												<input type="datetime-local" min="" class="form-control" value="${appoSelete.medicalRecord.reExaminationDate}"
													name="reExaminationDate" />
											</div>
										</div>
										<div class="form-group">
											<label for="comment">Chuẩn Đoán</label>
											<textarea class="form-control" rows="5" name="diagnose"
												id="comment"></textarea>
										</div>
										<div class="form-group">
											<label for="exampleForm2">Bác Sĩ</label> <input type="hidden"
												name="doctorId" value="${appoSelete.doctor.id }"> <input
												type="text" disabled="disabled"
												value="${appoSelete.medicalRecord.doctor.userDetail.fullname}"
												class="form-control">
										</div>
										<hr />
										<div>
											<div class="row">
												<div class="col-sm-6">
													<span class="bigger-110">Dịch Vụ</span>
												</div>
												<!-- /.span -->
												<div class="col-sm-6">
													<span class="pull-right inline"> <span class="grey">style:</span>

														<span class="btn-toolbar inline middle no-margin">
															<span id="chosen-multiple-style" data-toggle="buttons"
															class="btn-group no-margin"> <label
																class="btn btn-xs btn-yellow active"> 1 <input
																	type="radio" value="1" />
															</label> <label class="btn btn-xs btn-yellow"> 2 <input
																	type="radio" value="2" />
															</label>
														</span>
													</span>
													</span>
												</div>
												<!-- /.span -->
											</div>
											<div class="space-2"></div>
											<select multiple="" class="chosen-select form-control"
												id="form-field-select-4" name="serviceIds"
												data-placeholder="Choose a Serice...">
												<c:forEach items="${services }" var="item">
													<option value="${item.id }" selected="selected">${item.serviceName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.span -->
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>

<!-- /.main-content -->
<!-- /.js form date input -->
<script type="text/javascript">
	document.getElementById("myLocalDate").min = $(function() {
		$('#datetimepicker1').datetimepicker();
	});
</script>