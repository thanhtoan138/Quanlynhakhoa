<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Quản lý Hóa Đơn</li>
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
				<h1>Quản lý Hóa Đơn</h1>
			</div>
			<!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="container">
						<div class="col-xs-8">
							<div class="table-title">
								<div class="row">
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
										<th>Mã phiếu khám</th>
										<th>Mã hóa đơn</th>
										<th class="hidden-480">Tên bệnh nhân</th>
										<th class="hidden-480">Tên bác sĩ</th>
										<th>Ngày khám</th>
										<th>Ngày tái khám</th>
										<th>Tên người tạo</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${medicalRecords}" var="item">
											<tr>
												<td>${item.id }</td>
												<td>${item.bill.id }</td>
												<td>${item.patient.userDetail.fullname }</td>
												<td>${item.doctor.userDetail.fullname }</td>
												<td>${item.examinationDate }</td>
												<td>${item.reExaminationDate }</td>
												<td>${item.createBy }</td>
												<td><a ${hidden } class="add" title="Add"
													data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
													<a ${hidden } class="edit" title="Edit"
													data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
													<a ${hidden } class="delete" title="Delete"
													data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a></td>
											</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
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
<script type="text/javascript">
	var updateId = null;
	var listName = [ "id", "username", "password", "role_name", "created_by",
			"action" ];
	function setUpdateId(id) {
		updateId = id;
	}
	$(document)
			.ready(
					function() {
						$('[data-toggle="tooltip"]').tooltip();
						var actions = $("table td:last-child").html();
						// Append table with add row form on add new button click
						$(".add-new")
								.click(
										function() {
											$(this)
													.attr("disabled",
															"disabled");
											var index = $(
													"table tbody tr:first-child")
													.index();
											var row = '<tr>'
													+ '<td><input type="text" class="form-control" value="Tự sinh" readonly="readonly"></td>'
													+ '<td><input type="text" class="form-control" name="username" form="create"></td>'
													+ '<td><input type="text" class="form-control" name="password" form="create"></td>'
													+ '<td><select form="create" class="chosen-select form-control" id="form-field-select-4" name="roleId" data-placeholder="Choose Role..."><c:forEach items="${roles }" var="item"><option value="${item.id }">${item.roleName }</option></c:forEach></select></td>'
													+ '<td><input type="text" class="form-control" name="created_by" value="${sessionScope.user.username}"></td>'
													+ '<td><form id="create" action="/admin/createUser" method="post"><input hidden="" name="id" value="${item.id }"><button type="submit" class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></button></form></tr>';
											$("table").prepend(row);
											$("table tbody tr").eq(index).find(
													".add, .edit").toggle();
											$('[data-toggle="tooltip"]')
													.tooltip();
										});
						// Edit row on edit button click
						$(document)
								.on(
										"click",
										".edit",
										function() {
											$(this)
													.parents("tr")
													.find("td:not(:last-child)")
													.each(
															function(index) {
																$(this)
																		.html(
																				function() {
																					if (listName[index] == 'role_name') {
																						return '<select form="' + updateId + '" class="chosen-select form-control" id="form-field-select-4" name="roleId" data-placeholder="Choose Role...">'
																								+ '<c:forEach items="${roles }" var="item"><option value="${item.id }">${item.roleName }</option></c:forEach>'
																								+ '</select>';
																					} else {
																						if (listName[index] == 'id') {
																							return '<input disabled type="text" name="id" form="'
																									+ updateId
																									+ '" class="form-control" value="'
																									+ $(
																											this)
																											.text()
																									+ '">';
																						}
																						if (listName[index] == 'created_by') {
																							return '<input disabled type="text" name='
																									+ listName[index]
																									+ ' form="'
																									+ updateId
																									+ '" class="form-control" value="'
																									+ $(
																											this)
																											.text()
																									+ '">';
																						} else {
																							return '<input type="text" name='
																									+ listName[index]
																									+ ' form="'
																									+ updateId
																									+ '" class="form-control" value="'
																									+ $(
																											this)
																											.text()
																									+ '">';
																						}
																					}
																				})
															});
											$(this).parents("tr").find(
													".add, .edit").toggle();
											$(".add-new").attr("disabled",
													"disabled");
											updateId = null;
										});
						// Delete row on delete button click
						$(document).on("click", ".delete", function() {
							$(this).parents("tr").remove();
							$(".add-new").removeAttr("disabled");
						});
					});
</script>
<!-- /.main-content -->