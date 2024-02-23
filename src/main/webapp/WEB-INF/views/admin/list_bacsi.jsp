<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Quản lý Bác Sĩ</li>
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
				<h1>Quản lý Bác Sĩ</h1>
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
										<th>Hình ảnh</th>
										<th class="hidden-480">Mã Bác sĩ</th>
										<th class="hidden-480">Tên đăng nhập</th>
										<th class="hidden-480">Họ và tên</th>
										<th>Giới tính</th>
										<th>Tuổi</th>
										<th>Điện thoại</th>
										<th>Email</th>
										<th class="hidden-480">Địa chỉ</th>
										<th>Trình độ</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${doctors}" var="item">
										<tr>
											<td><img  src="/Uploads/${item.userDetail.avartar }" class="avatar"
												alt="Avatar" width="70%"></td>
											<td>${item.id }</td>
											<td>${item.account.username }</td>
											<td>${item.userDetail.fullname }</td>
											<td>${item.userDetail.gender }</td>
											<td>${item.userDetail.age }</td>
											<td>${item.userDetail.phone }</td>
											<td>${item.userDetail.email }</td>
											<td>${item.userDetail.address }</td>
											<td>${item.degree }</td>
											<td><form id="${item.id }" action="/admin/updateDoctor"
													method="post">
													<input hidden="" name="id" value="${item.id }" readonly="readonly">
													<button type="submit" class="add" title="Add"
														data-toggle="tooltip">
														<i class="material-icons">&#xE03B;</i>
													</button>
												</form> <a class="edit" onclick="setUpdateId(${item.id})"
												title="Edit" data-toggle="tooltip"><i
													class="material-icons">&#xE254;</i></a>
												<form action="/admin/deleteDoctor" method="post">
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
		var listName = ["avatar", "id", "accountId", "fullname","gender", "age", "phone", "email", "address", "degree", "action"];
		function setUpdateId(id) {
			updateId = id;
		}
		$(document)
			.ready(
				function () {
					$('[data-toggle="tooltip"]').tooltip();
					var actions = $("table td:last-child").html();
					// Append table with add row form on add new button click
					$(".add-new")
						.click(
							function () {
								$(this)
									.attr("disabled",
										"disabled");
								var index = $(
									"table tbody tr:first-child")
									.index();
								var row = '<tr>'
									+ '<td><input multiple="" name="avatar" form="create" id="id-input-file-3" type="file" value=""></td>'
									+ '<td><input type="text" class="form-control" value="Tự sinh" readonly="readonly"></td>'
									+ '<td><select form="create" class="chosen-select form-control" id="form-field-select-4" name="accountId" data-placeholder="Choose Role..."><c:forEach items="${accounts }" var="item"><option value="${item.id }">${item.username }</option></c:forEach></select></td>'
									+ '<td><input form="create" type="text" class="form-control" name="fullname" form="create"></td>'
									+ '<td><div class="radio"><label> <input type="radio" class="ace" form="create" name="gender" formvalue="true" selected /> <span class="lbl">Nam</span></label></div>'
										+'<div class="radio"><label> <input type="radio" class="ace" form="create" name="gender" /> <span class="lbl">Nữ</span></label></div></div></td>'
									+ '<td><input form="create" type="number" min="5" class="form-control" name="age" value=""></td>'
									+ '<td><input form="create" type="number" class="form-control" name="phone" value=""></td>'
									+ '<td><input form="create" type="email" class="form-control" name="email" value=""></td>'
									+ '<td><input form="create" type="text" class="form-control" name="address" value=""></td>'
									+ '<td><input form="create" type="text" class="form-control" name="degree" value=""></td>'
									+ '<td><form enctype="multipart/form-data" id="create" action="/admin/createDoctor" method="post"><button type="submit" class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></button></form></tr>';
								$("table").prepend(row);
								$("table tbody tr").eq(index)
									.find(".add, .edit")
									.toggle();
								$('[data-toggle="tooltip"]')
									.tooltip();
							});
					// Edit row on edit button click
					$(document).on(
						"click",
						".edit",
						function () {
							$(this).parents("tr").find(
								"td:not(:last-child)").each(
									function (index) {
										$(this).html(
											function () {
												if (listName[index] == 'avatar') {
													var src = $(this).find('img').attr('src');
													return '<img src="'+src+'" class="avatar" alt="Avatar" width="70%"><figcaption>Hình cũ</figcaption><input multiple="" name=' + listName[index] + ' form="'+updateId+'" id="id-input-file-3" type="file" value="">';
												}
												else if (listName[index] == 'id') {
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
												else {
														return '<input type="text" name=' + listName[index] + ' form="' + updateId + '" class="form-control" value="'
														+ $(this)
															.text()
														+ '">';
													}
											})	
									});
							$(this).parents("tr").find(".add, .edit")
								.toggle();
							$(".add-new").attr("disabled", "disabled");
							updateId = null;
						});
				});
	</script>
<!-- /.main-content -->