<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<ul class="nav nav-list">
	<c:if test="${sessionScope.user.role.id == 0 }">
		<li class="active"><a href="/admin"> <i
				class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
					TRANG CHỦ </span>
		</a> <b class="arrow"></b></li>
	</c:if>
	<c:if test="${sessionScope.user.role.id == 1 }">
		<li class="active"><a href="/staff"> <i
				class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
					TRANG CHỦ </span>
		</a> <b class="arrow"></b></li>
	</c:if>
	<c:if test="${sessionScope.user.role.id == 2 }">
		<li class="active"><a href="/doctor"> <i
				class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
					TRANG CHỦ </span>
		</a> <b class="arrow"></b></li>
	</c:if>


	<li class=""><a href="#" class="dropdown-toggle"> <i
			class="menu-icon fa fa-desktop"></i> <span class="menu-text">
				Quản lý thông tin </span> <b class="arrow fa fa-angle-down"></b>
	</a> <b class="arrow"></b>

		<ul class="submenu">
			<!-- <li class="">
								<a href="table-taikhoan.html" class="dropdown-toggle">
									<i class="menu-icon fa fa-caret-right"></i>

									Tài Khoản
									<b class="arrow fa fa-angle-down"></b>
								</a>

								<b class="arrow"></b>

								<ul class="submenu">
									<li class="">
										<a href="top-menu.html">
											<i class="menu-icon fa fa-caret-right"></i>
											Top Menu
										</a>

										<b class="arrow"></b>
									</li>

									<li class="">
										<a href="two-menu-1.html">
											<i class="menu-icon fa fa-caret-right"></i>
											Two Menus 1
										</a>

										<b class="arrow"></b>
									</li>

									<li class="">
										<a href="two-menu-2.html">
											<i class="menu-icon fa fa-caret-right"></i>
											Two Menus 2
										</a>

										<b class="arrow"></b>
									</li>

									<li class="">
										<a href="mobile-menu-1.html">
											<i class="menu-icon fa fa-caret-right"></i>
											Default Mobile Menu
										</a>

										<b class="arrow"></b>
									</li>

									<li class="">
										<a href="mobile-menu-2.html">
											<i class="menu-icon fa fa-caret-right"></i>
											Mobile Menu 2
										</a>

										<b class="arrow"></b>
									</li>

									<li class="">
										<a href="mobile-menu-3.html">
											<i class="menu-icon fa fa-caret-right"></i>
											Mobile Menu 3
										</a>

										<b class="arrow"></b>
									</li>
								</ul>
							</li> -->
			<!-- Admin -->
			<c:if test="${sessionScope.user.role.id == 0 }">
				<li class=""><a
					href="${pageContext.request.contextPath}/admin/users"> <i
						class="menu-icon fa fa-caret-right"></i> Tài Khoản
				</a> <b class="arrow"></b></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/admin/doctors"> <i
						class="menu-icon fa fa-caret-right"></i> Bác Sĩ
				</a> <b class="arrow"></b></li>

				<li class=""><a
					href="${pageContext.request.contextPath}/admin/services"> <i
						class="menu-icon fa fa-caret-right"></i> Dịch Vụ
				</a> <b class="arrow"></b></li>

				<li class=""><a
					href="${pageContext.request.contextPath}/admin/bills"> <i
						class="menu-icon fa fa-caret-right"></i> Hóa Đơn
				</a> <b class="arrow"></b></li>
			</c:if>
			<!-- Staff -->
			<c:if test="${sessionScope.user.role.id == 1 }">
				<li class=""><a
					href="${pageContext.request.contextPath}/staff/appos"> <i
						class="menu-icon fa fa-caret-right"></i> Lịch Hẹn
				</a> <b class="arrow"></b></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/staff/bills"> <i
						class="menu-icon fa fa-caret-right"></i> Hóa Đơn
				</a> <b class="arrow"></b></li>

				<li class=""><a
					href="${pageContext.request.contextPath}/staff/services"> <i
						class="menu-icon fa fa-caret-right"></i> Dịch Vụ
				</a> <b class="arrow"></b></li>

				<li class=""><a
					href="${pageContext.request.contextPath}/staff/patients"> <i
						class="menu-icon fa fa-caret-right"></i> Bệnh nhân
				</a> <b class="arrow"></b></li>
			</c:if>
			<!-- Doctor -->
			<c:if test="${sessionScope.user.role.id == 2	 }">
				<li class=""><a
					href="${pageContext.request.contextPath}/doctor/MedicalRecord">
						<i class="menu-icon fa fa-caret-right"></i> Phiếu Khám Bệnh
				</a> <b class="arrow"></b></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/doctor/MedicalRecords">
						<i class="menu-icon fa fa-caret-right"></i> Danh Sách Phiếu Khám
				</a> <b class="arrow"></b></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/doctor/services"> <i
						class="menu-icon fa fa-caret-right"></i>Xem dịch vụ
				</a> <b class="arrow"></b></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/doctor/historyMedical">
						<i class="menu-icon fa fa-caret-right"></i> Lịch sử khám
				</a> <b class="arrow"></b></li>
			</c:if>
		</ul></li>
	<li class=""><a href="#" class="dropdown-toggle"> <i
			class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text">
				Quản ly khám bệnh </span> <b class="arrow fa fa-angle-down"></b>
	</a> <b class="arrow"></b>

		<ul class="submenu">
			<li class=""><a href="form-elements.html"> <i
					class="menu-icon fa fa-caret-right"></i> Lịch Khám
			</a> <b class="arrow"></b></li>

			<li class=""><a href="form-elements-2.html"> <i
					class="menu-icon fa fa-caret-right"></i> Phiếu Khám
			</a> <b class="arrow"></b></li>

			<li class=""><a href="form-wizard.html"> <i
					class="menu-icon fa fa-caret-right"></i> Hóa Đơn
			</a> <b class="arrow"></b></li>
		</ul></li>
</ul>