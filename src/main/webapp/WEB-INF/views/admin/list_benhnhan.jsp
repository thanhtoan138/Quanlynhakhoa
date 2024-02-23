W<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Quản lý Bệnh Nhân</li>
			</ul>
			<!-- /.breadcrumb -->

			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon"> <input type="text" placeholder="Tìm kiếm ..." class="nav-search-input"
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
					Quản lý Bệnh Nhân
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
						<div class="col-xs-8">
							<div class="table-title">
								<div class="row">
								</div>
							</div>
							<table id="simple-table" class="table  table-bordered table-hover">
								<thead>
									<tr>

										<th>Mã bệnh nhân</th>
										<th class="hidden-480">Họ và tên</th>
										<th>Giới tính</th>
										<th>Tuổi</th>
										<th>Điện thoại</th>
										<th>Email</th>
										<th>Địa chỉ</th>
										<th>Ngày tạo</th>
										<th>Người tạo</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${patients}" var="item">
										<tr>
											<td class="center">${item.id }</td>
											<td>${item.userDetail.fullname }</td>
											<td>${item.userDetail.gender }</td>
											<td>${item.userDetail.age }</td>
											<td>${item.userDetail.phone }</td>
											<td>${item.userDetail.email }</td>
											<td>${item.userDetail.address }</td>
											<td>${item.createDate }</td>
											<td>${item.createBy }</td>
											<td><form id="${item.id }" action="/staff/updatePatient"
													method="post">
													<input hidden="" name="id" value="${item.id }" readonly="readonly">
													<button type="submit" class="add" title="Add"
														data-toggle="tooltip">
														<i class="material-icons">&#xE03B;</i>
													</button>
												</form> <a class="edit" onclick="setUpdateId(${item.id})"
												title="Edit" data-toggle="tooltip"><i
													class="material-icons">&#xE254;</i></a>
												<form action="/staff/deletePatient" method="post">
													<input hidden="" name="id" value="${item.id }">
													<button type="submit" class="delete" title="Delete"
														data-toggle="tooltip">
														<i class="material-icons">&#xE872;</i>
													</button>
												</form></td>
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
	var listName = ["id", "fullname", "gender", "age", "email", "address",
		"createDate", "createBy", "action"];
	function setUpdateId(id) {
		updateId = id;
	}
	$(document)
		.ready(
			function () {
				$('[data-toggle="tooltip"]').tooltip();
				var actions = $("table td:last-child").html();
				// Edit row on edit button click
				$(document)
					.on(
						"click",
						".edit",
						function () {
							$(this)
								.parents("tr")
								.find("td:not(:last-child)")
								.each(
									function (index) {
										$(this)
											.html(
												function () {
													 if (listName[index] == 'id') {
													return $(this).text();
												}
												else if (listName[index] == 'accountId') {
													return '<select form="' + updateId + '" class="chosen-select form-control" id="form-field-select-4" name=' + listName[index] + ' data-placeholder="Choose Role...">' +
														'<c:forEach items="${accounts }" var="item"><option value="${item.id }">${item.username }</option></c:forEach>' +
														'</select>';
												}
												else if (listName[index] == 'gender') {
														return '<div class="radio"><label> <input type="radio" class="ace" form="' + updateId + '" name=' + listName[index] + ' form value="true" selected /> <span class="lbl">Nam</span></label></div>'
															+'<div class="radio"><label> <input type="radio" class="ace" form="' + updateId + '" name=' + listName[index] + ' /> <span class="lbl">Nữ</span></label></div>';
													}
												else if (listName[index] == 'age') {
														return '<input type="number" class="form-control" name=' + listName[index] + ' form="' + updateId + '" value="'
														+ $(this)
														.text()
													+ '">';
												}
												else if (listName[index] == 'createDate') {
														return $(this).text();
													}
												else if (listName[index] == 'phone') {
														return '<input type="number" id="phone" class="form-control" form="' + updateId + '" name=' + listName[index] + ' required="required" value="'
														+ $(this)
														.text()
													+ '">';
													}
												else if (listName[index] == 'email') {
														return '<input type="email" name=' + listName[index] + ' form="' + updateId + '" class="form-control" value="'
														+ $(this)
															.text()
														+ '">';
													}
												else if (listName[index] == 'createBy') {
													return '<input readonly="readonly" type="text" name=' + listName[index] + ' form="' + updateId + '" class="form-control" value="'
													+ $(this)
														.text()
													+ '" >';
												}
												else {
														return '<input type="text" name=' + listName[index] + ' form="' + updateId + '" class="form-control" value="'
														+ $(this)
															.text()
														+ '">';
													}
												})
									});
							$(this).parents("tr").find(
								".add, .edit").toggle();
							$(".-new").attr("disabled",
								"disabled");
							updateId = null;
						});
				// Delete row on delete button click
				$(document).on("click", ".delete", function () {
					$(this).parents("tr").remove();
					$(".add-new").removeAttr("disabled");
				});
			});
</script>
<!-- /.main-content -->