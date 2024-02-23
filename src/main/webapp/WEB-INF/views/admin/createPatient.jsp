<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
						Chủ</a></li>
				<li class="active">Bảng Tin</li>
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
				<h1>Tạo Bệnh Nhân</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-6">
					<!-- PAGE CONTENT BEGINS -->

					<form action="/staff/createPatient" method="post"
						enctype="multipart/form-data">
						<input type="text" hidden="" value="${appoItem.id }" name="appoId">
						<div class="form-group">
							<label class="control-label bolder blue" for="fullname">Tên Bệnh Nhân</label> <input
								value="${appoItem.patientName }" name="fullname" type="text"
								id="fullname" class="form-control">
						</div>
						<label class="control-label bolder blue">Địa Chỉ</label>
						<div class="form-group">

							<div class='input-group'>
								<input id="address" type="text" class="form-control"
									name="address" value="" />
							</div>
						</div>
						<label class="control-label bolder blue">Tuổi</label>
						<div class="form-group">

							<div class='input-group'>
								<input id="age" type="number" min="" class="form-control" name="age"
									value="" />
							</div>
						</div>

						<!-- <div class="widget-main">

							<input type="text" id="spinner1" name="age" />
							<div class="space-6"></div>
						</div> -->
						<label class="control-label bolder blue">Email</label>
						<div class="form-group">
							<input type="email" id="email" value="${appoItem.email }"
								class="form-control" name="email" />
						</div>
						<label class="control-label bolder blue">Số điện thoại</label>
						<div class="form-group">
							<input type="text" id="phone" value="${appoItem.phone }"
								class="form-control" name="phone" required="required" />
						</div>
						<div class="control-group">
							<label class="control-label bolder blue">Giới tính</label>
							<div class="radio">
								<label> <input type="radio" class="ace" name="gender"
									value="true" selected /> <span class="lbl">Nam</span>
								</label>
							</div>

							<div class="radio">
								<label> <input type="radio" class="ace" name="gender"
									value="false" /> <span class="lbl">Nữ</span>
								</label>
							</div>
						</div>

						<!-- <div class="input-group is-invalid">
							<div class="custom-file">
								<input type="file" name="avatar" class="custom-file-input"
									id="avatar" required> <label class="custom-file-label"
									for="avatar">Choose file...</label>
							</div>
						</div> -->

						<div class="form-group">
							<label class="control-label bolder blue">Hình Ảnh</label>
							<div class="col-xs-12">
								<input multiple="" name="avatar" type="file"
								 id="id-input-file-3" />
							</div>
						</div>
						<!-- <input type="submit" title="Tạo bệnh nhân"> -->
						<button class="btn btn-info" type="submit">
							<i class="ace-icon fa fa-check bigger-110"></i> Tạo Bệnh Nhân
						</button>
					</form>

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