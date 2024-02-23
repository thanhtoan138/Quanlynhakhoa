<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
			<form action="/staff/createMedicalRecord" method="post">
				<div class="widget-main">
					<input hidden="" value="${appoSelete.id}" name="appoId" type="text"
						id="exampleForm2" class="form-control">
					<div class="form-group">
						<label for="exampleForm2">Mã bệnh nhân</label> <input
							value="${appoSelete.patient.id}" name="patientId" type="text"
							id="exampleForm2" class="form-control">
					</div>
					<div class="form-group">
						<label for="exampleForm2">Tên Bệnh Nhân</label> <input
							value="${appoSelete.patient.userDetail.fullname}" name="fullname"
							type="text" id="exampleForm2" class="form-control">
					</div>
					<div class="form-group">
						<label for="exampleForm2">Ngày Khám Bệnh</label>
						<div class='input-group'>
							<input type="datetime-local" class="form-control"
								value="${DateNow }" name="examinationDate" required="required"/>
						</div>
					</div>
					<c:if test="${sessionScope.user.role.id == 2 }">
						<div class="form-group">
							<label for="exampleForm2">Ngày Tái Khám</label>
							<div class='input-group'>
								<input type="datetime-local" class="form-control"
									name="reExaminationDate" />
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.user.role.id == 2 }">
						<div class="form-group">
							<label for="comment">Chuẩn Đoán</label>
							<textarea class="form-control" rows="5" name="diagnose"
								id="comment"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleForm2">Bác Sĩ</label> <input type="hidden"
								name="doctorId" value="${appoSelete.doctor.id }"> <input
								type="text" value="${appoSelete.doctor.userDetail.fullname}"
								class="form-control">
						</div>
					</c:if>
					<hr />
					<div>
						<c:if test="${sessionScope.user.role.id == 2 }">
							<div class="row">
								<div class="col-sm-6">
									<span class="bigger-110">Dịch Vụ</span>
								</div>
								<!-- /.span -->
								<div class="col-sm-6">
									<span class="pull-right inline"> <span class="grey">style:</span>

										<span class="btn-toolbar inline middle no-margin"> <span
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
						</c:if>

						<div class="space-2"></div>
						<select class="chosen-select form-control"
							id="form-field-select-4" name="doctorId"
							data-placeholder="Choose a State..."
							<c:if test="${sessionScope.user.role.id == 2 }">disabled="disabled"</c:if>>
							<c:forEach items="${doctors }" var="item">
								<option value="${item.id }">${item.userDetail.fullname }</option>
							</c:forEach>
						</select>
						<div class="space-2">Bác sĩ</div>
						<c:if test="${sessionScope.user.role.id == 2 }">
							<select multiple="" class="chosen-select form-control"
								id="form-field-select-4" name="serviceIds"
								data-placeholder="Choose a State...">
								<c:forEach items="${services }" var="item">
									<option value="${item.id }">${item.serviceName }</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
				</div>
				<c:if test="${sessionScope.user.role.id == 2 }">
					<input type="submit" title="Khám xong">
				</c:if>
				<input type="submit" title="Tạo phiếu khám">
			</form>
		</div>
	</div>
</div>