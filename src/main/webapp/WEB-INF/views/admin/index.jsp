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
				<h1>
					Bảng tin
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
					<div class="alert alert-block alert-success">
						<button type="button" class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
						</button>

						<i class="ace-icon fa fa-check green"></i> Chào Mừng Đến Với <strong
							class="green"> Phòng Khám Nha Khoa <small>(v1.4)</small>
						</strong>
					</div>


					<!-- <div class="hr hr32 hr-dotted"></div> -->



					<!-- PAGE CONTENT ENDS -->

					<!-- start -->
					<div id="layoutSidenav_content">
						<main>
							<div class="container-fluid">
								<div class="row">
									<div class="col-lg-6">
										<div class="card mb-4">
											<div class="card-header">
												<i class="fas fa-chart-bar mr-1"></i> Doanh thu theo quý
											</div>
											<hr>
											<div class="space-2"></div>
											<select multiple="" class="chosen-select form-control"
												id="form-field-select-4" name="serviceIds"
												data-placeholder="Choose a State...">
												<c:forEach items="${years }" var="item">
													<option value="${item }">${item }</option>
												</c:forEach>
											</select>
											<div class="card-body">
												<canvas id="myBarChart" width="100%" height="50"></canvas>
											</div>
											<div class="card-footer small text-muted">Dữ liệu năm:
												${year }</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="card mb-4">
											<div class="card-header">
												<i class="fas fa-chart-pie mr-1"></i> Tỷ lệ đặt hẹn trong
												tháng
												<form action="/admin">
													<input type="date" name="dateStart" value="${dateStart }">
													<input type="date" name="dateEnd" value="${dateEnd }">
													<input type="submit" title="Lọc">
												</form>
												
											</div>
											<div class="card-body">
												<canvas id="myPieChart" width="100%" height="50"></canvas>
											</div>
											<div class="card-footer small text-muted">Dữ liệu từ:
												${dateStart } đến ${dateEnd }</div>
										</div>
									</div>
								</div>
							</div>
						</main>
						<footer class="py-4 bg-light mt-auto">
							<div class="container-fluid">
								<div
									class="d-flex align-items-center justify-content-between small">
									<div class="text-muted">Copyright &copy; Your Website
										2020</div>
									<div>
										<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
											&amp; Conditions</a>
									</div>
								</div>
							</div>
						</footer>
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.5.1.min.js"
					crossorigin="anonymous"></script>
				<script
					src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
					crossorigin="anonymous"></script>
				<script src="js/scripts.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
					crossorigin="anonymous"></script>
				<script>
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';

	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["Quý 1", "Quý 2", "Quý 3", "Quý 4"],
	    datasets: [{
	      label: "Revenue",
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: [${Q1}, ${Q2}, ${Q3}, ${Q4}],
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 6
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: Math.max(${Q1}, ${Q2}, ${Q3}, ${Q4}),
	          maxTicksLimit: 3
	        },
	        gridLines: {
	          display: true
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});

	</script>
				<script>
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Pie Chart Example
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "Số phiếu khám đã khám", "số phiếu khám chưa khám"],
				datasets : [ {
					data : [ ${appoTrue}, ${appoFalse}],
					backgroundColor : [ '#007bff', '#dc3545', '#ffc107',
							'#28a745' ],
				} ],
			},
		});
	</script>

				<!-- end -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.page-content -->
</div>
</div>
<!-- /.main-content -->