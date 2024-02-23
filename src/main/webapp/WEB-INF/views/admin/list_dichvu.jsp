<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Quản lý Dịch Vụ</li>
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
				<h1>Quản lý Dịch Vụ</h1>
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
										<th>Mã dịch vụ</th>
										<th class="hidden-480">Tên dịch vụ</th>
										<th class="hidden-480">Đơn vị</th>
										<th>Giá tiền (VNĐ)</th>
										<th>Người tạo</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${services}" var="item">
										<tr>
											<td>${item.id }</td>
											<td>${item.serviceName }</td>
											<td>${item.unit }</td>
											<td>${item.price }</td>
											<td>${item.createBy }</td>
											<td>
												<form id="${item.id }" action="/staff/updateService"
													method="post">
													<input hidden="" name="id" value="${item.id }"
														readonly="readonly">
													<button type="submit" class="add" title="Add"
														data-toggle="tooltip">
														<i class="material-icons">&#xE03B;</i>
													</button>
												</form> <a class="edit" onclick="setUpdateId(${item.id})"
												title="Edit" data-toggle="tooltip"><i
													class="material-icons">&#xE254;</i></a>
												<form action="/staff/deleteService" method="post">
													<input hidden="" name="id" value="${item.id }">
													<button type="submit" class="delete" title="Delete"
														data-toggle="tooltip">
														<i class="material-icons">&#xE872;</i>
													</button>
												</form>
											</td>
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
	<script type="text/javascript">
	var updateId = null;
	var listName = ["id", "serviceName", "unit", "price", "create_by", "action"];
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
								+ '<td><input type="text" class="form-control" value="Tự sinh" readonly="readonly"></td>'
								+ '<td><input type="text" class="form-control" name="serviceName" form="create"></td>'
								+ '<td><input type="text" class="form-control" name="unit" form="create"></td>'
								+ '<td><input type="text" class="form-control" name="price" form="create"></td>'
								+ '<td><input type="text" class="form-control" name="created_by" value="${sessionScope.user.username}"></td>'
								+ '<td><form id="create" action="/staff/createService" method="post"><input hidden="" name="id" value="${item.id }"><button type="submit" class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></button></form></tr>';
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
											
												if (listName[index] == 'id') {
													return '<input disabled type="text" name="id" form="' + updateId + '" class="form-control" value="'
													+ $(this)
														.text()
													+ '">';
												}else{
													
												
												if (listName[index] == 'created_by') {
													return '<input disabled type="text" name=' + listName[index] + ' form="' + updateId + '" class="form-control" value="'
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
</div>
<!-- /.main-content -->