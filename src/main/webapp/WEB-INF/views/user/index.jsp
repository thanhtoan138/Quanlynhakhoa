<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container-fluid px-md-0">
				<div class="row no-gutters">
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="consultation w-100 text-center px-4 px-md-5">
							<h3 class="mb-4">Dịch vụ nha khoa</h3>
							<p>A small river named Duden flows by their place and supplies</p>
							<a href="#" class="btn-custom">See Services</a>
						</div>
					</div>
					<div class="col-md-6 d-flex align-items-stretch">
					<div class="consultation consul w-100 px-4 px-md-5">
						<div class="text-center">
							<h3 class="mb-4">Đặt Lịch Hẹn</h3>
						</div>
						<form action="/appoin/create" class="appointment-form"
							method="POST">

							<div class="row">
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Họ và tên" name="patientName">
									</div>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
										<input type="text" class="form-control input-mask-phone"
											placeholder="Điện thoại" name="phone">
									</div>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
							<input type="text" class="form-control" placeholder="Email"
											name="email">

									</div>
								</div>
								<!-- <div class="col-md-12 col-lg-6 col-xl-4">
										<div class="form-group">
				    					<div class="form-field">
		          					<div class="select-wrap">
		                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                      <select name="" id="" class="form-control">
		                      	<option value="">Dịch vụ</option>
		                        <option value="">Nhổ răng</option>
		                        <option value="">Trám răng</option>
		                        <option value="">Tẩy trắng răng</option>
		                        <option value="">Cạo vôi răng</option>
		                        <option value="">Nha chu</option>
                            <option value="">Niềng răng</option>
                            <option value="">Rút tủy răng</option>
                            <option value="">Cười hở lợi</option>
		                      </select>
		                    </div>
				              </div>
				    				</div>
									</div> -->
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
										<div class="input-wrap">
											<input type="date" class="form-control"
												placeholder="Ngày" name="dateCome">
										</div>
									</div>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
										<div class="input-wrap">
											<input type="time" class="form-control"
												name="timeCome" placeholder="Giờ">

										</div>
									</div>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon">
													<span class="ion-ios-arrow-down"></span>
												</div>
												<select name="doctorId" class="form-control">
													<c:forEach items="${doctors}" var="item">
														<option value="${item.id}">${item.userDetail.fullname }</option>
													</c:forEach>
													</select>														
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 col-lg-12 col-xl-8">
									<div class="form-group">
										<textarea name="symptom" class="form-control"
											placeholder="Triệu chứng "></textarea>
									</div>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-4">
									<div class="form-group">
										<input type="submit" value="Đặt Hẹn"
											class="btn btn-secondary py-2 px-4">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="consultation w-100 text-center px-4 px-md-5">
							<h3 class="mb-4">Tìm Bác Sĩ</h3>
							<p>A small river named Duden flows by their place and supplies</p>
							<a href="#" class="btn-custom">Mee our doctor</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	
	<section class="ftco-section ftco-services">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-8 text-center heading-section ftco-animate">
					<span class="subheading">Dịch vụ</span>
					<h2 class="mb-4">Dịch vụ phòng khám của chúng tôi</h2>
					<p>Separated they live in. A small river named Duden flows by
						their place and supplies it with the necessary regelialia. It is a
						paradisematic country</p>
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-drilling"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Nhổ Răng</h3>
							<p>Nhổ răng người lớn
							<p>Nhổ răng trẻ em</p>
						
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-tooth"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Nha Khoa Thẩm Mỹ</h3>
							<p>Cười hở lợi – Điều trị bằng filler</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-dental-floss"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Trám răng Composite</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>

				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-shiny-tooth"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Tẩy Trắng Răng</h3>
							<p>Tẩy trắng răng là phương pháp giúp thay đổi và cải thiện
								màu sắc của răng xỉn màu, ố vàng trở nên trắng sáng, đẹp thẩm mỹ
								hơn.</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-dentist-chair"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Cạo Vôi Răng</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-tooth-1"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Nha Chu</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-tooth-with-braces"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Niềng Răng</h3>
							<p>Là kỹ thuật chỉnh nha tối ưu cho những trường hợp răng mọc
								lệch lạc, ảnh hưởng đến ăn nhai và thẩm mỹ chung của hàm răng,
								nụ cười.</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
					<div class="media block-6 d-block text-center">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-decayed-tooth"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Rút Tủy Răng</h3>
							<p>Công nghệ vi phẫu tân tiến đã giúp cho khách hàng gặp phải
								tình trạng răng bị viêm tủy, tổn thương thương có khả năng điều
								trị phục hồi mà không cần phải nhổ bỏ như trước đây.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section intro"
		style="background-image: url(/static/images/bg_3.jpg);"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h3 class="mb-4">We promised to take care our patients and we
						delivered.</h3>
					<p>A small river named Duden flows by their place and supplies
						it with the necessary regelialia. It is a paradisematic country</p>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-8 text-center heading-section ftco-animate">
					<span class="subheading">Doctors</span>
					<h2 class="mb-4">Our Qualified Doctors</h2>
					<p>Separated they live in. A small river named Duden flows by
						their place and supplies it with the necessary regelialia. It is a
						paradisematic country</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img-wrap d-flex align-items-stretch">
							<div class="img align-self-stretch"
								style="background-image: url(/static/images/doc-1.jpg);"></div>
						</div>
						<div class="text pt-3 text-center">
							<h3>Dr. Lloyd Wilson</h3>
							<span class="position mb-2">Denstist</span>
							<div class="faded">
								<p>I am an ambitious workaholic, but apart from that, pretty
									simple person.</p>
								<ul class="ftco-social text-center">
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img-wrap d-flex align-items-stretch">
							<div class="img align-self-stretch"
								style="background-image: url(/static/images/doc-2.jpg);"></div>
						</div>
						<div class="text pt-3 text-center">
							<h3>Dr. Rachel Parker</h3>
							<span class="position mb-2">Dentist</span>
							<div class="faded">
								<p>I am an ambitious workaholic, but apart from that, pretty
									simple person.</p>
								<ul class="ftco-social text-center">
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img-wrap d-flex align-items-stretch">
							<div class="img align-self-stretch"
								style="background-image: url(/static/images/doc-3.jpg);"></div>
						</div>
						<div class="text pt-3 text-center">
							<h3>Dr. Ian Smith</h3>
							<span class="position mb-2">Dentist</span>
							<div class="faded">
								<p>I am an ambitious workaholic, but apart from that, pretty
									simple person.</p>
								<ul class="ftco-social text-center">
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img-wrap d-flex align-items-stretch">
							<div class="img align-self-stretch"
								style="background-image: url(/static/images/doc-4.jpg);"></div>
						</div>
						<div class="text pt-3 text-center">
							<h3>Dr. Alicia Henderson</h3>
							<span class="position mb-2">Dentist</span>
							<div class="faded">
								<p>I am an ambitious workaholic, but apart from that, pretty
									simple person.</p>
								<ul class="ftco-social text-center">
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#"
										class="d-flex align-items-center justify-content-center"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-8 text-center heading-section ftco-animate">
					<span class="subheading">Testimonials</span>
					<h2 class="mb-4">Our Patients Says About Us</h2>
				</div>
			</div>
			<div class="row ftco-animate justify-content-center">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel">
						<div class="item">
							<div class="testimony-wrap d-flex">
								<div class="user-img"
									style="background-image: url(/static/images/person_1.jpg)"></div>
								<div class="text pl-4 bg-light">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p class="name">Racky Henderson</p>
									<span class="position">Farmer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap d-flex">
								<div class="user-img"
									style="background-image: url(/static/images/person_2.jpg)"></div>
								<div class="text pl-4 bg-light">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p class="name">Henry Dee</p>
									<span class="position">Businessman</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap d-flex">
								<div class="user-img"
									style="background-image: url(/static/images/person_3.jpg)"></div>
								<div class="text pl-4 bg-light">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p class="name">Mark Huff</p>
									<span class="position">Students</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap d-flex">
								<div class="user-img"
									style="background-image: url(/static/images/person_4.jpg)"></div>
								<div class="text pl-4 bg-light">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p class="name">Rodel Golez</p>
									<span class="position">Striper</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap d-flex">
								<div class="user-img"
									style="background-image: url(/static/images/person_1.jpg)"></div>
								<div class="text pl-4 bg-light">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p class="name">Ken Bosh</p>
									<span class="position">Manager</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-intro"
		style="background-image: url(/static/images/bg_3.jpg);"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<h2>We Provide Free Dental Care Consultation</h2>
					<p class="mb-0">Your Health is Our Top Priority with
						Comprehensive, Affordable medical.</p>
					<p></p>
				</div>
				<div class="col-md-3 d-flex align-items-center">
					<p class="mb-0">
						<a href="#" class="btn btn-secondary px-4 py-3">Free
							Consutation</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-8 text-center heading-section ftco-animate">
					<span class="subheading">Pricing</span>
					<h2 class="mb-4">Our Pricing</h2>
					<p>Separated they live in. A small river named Duden flows by
						their place and supplies it with the necessary regelialia. It is a
						paradisematic country</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 ftco-animate">
					<div class="pricing-entry pb-5 text-center">
						<div>
							<h3 class="mb-4">Basic</h3>
							<p>
								<span class="price">$24.50</span> <span class="per">/
									session</span>
							</p>
						</div>
						<ul>
							<li>Diagnostic Services</li>
							<li>Professional Consultation</li>
							<li>Tooth Implants</li>
							<li>Surgical Extractions</li>
							<li>Teeth Whitening</li>
						</ul>
						<p class="button text-center">
							<a href="#" class="btn btn-primary px-4 py-3">Get Offer</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 ftco-animate">
					<div class="pricing-entry pb-5 text-center">
						<div>
							<h3 class="mb-4">Standard</h3>
							<p>
								<span class="price">$34.50</span> <span class="per">/
									session</span>
							</p>
						</div>
						<ul>
							<li>Diagnostic Services</li>
							<li>Professional Consultation</li>
							<li>Tooth Implants</li>
							<li>Surgical Extractions</li>
							<li>Teeth Whitening</li>
						</ul>
						<p class="button text-center">
							<a href="#" class="btn btn-primary px-4 py-3">Get Offer</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 ftco-animate">
					<div class="pricing-entry active pb-5 text-center">
						<div>
							<h3 class="mb-4">Premium</h3>
							<p>
								<span class="price">$54.50</span> <span class="per">/
									session</span>
							</p>
						</div>
						<ul>
							<li>Diagnostic Services</li>
							<li>Professional Consultation</li>
							<li>Tooth Implants</li>
							<li>Surgical Extractions</li>
							<li>Teeth Whitening</li>
						</ul>
						<p class="button text-center">
							<a href="#" class="btn btn-primary px-4 py-3">Get Offer</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 ftco-animate">
					<div class="pricing-entry pb-5 text-center">
						<div>
							<h3 class="mb-4">Platinum</h3>
							<p>
								<span class="price">$89.50</span> <span class="per">/
									session</span>
							</p>
						</div>
						<ul>
							<li>Diagnostic Services</li>
							<li>Professional Consultation</li>
							<li>Tooth Implants</li>
							<li>Surgical Extractions</li>
							<li>Teeth Whitening</li>
						</ul>
						<p class="button text-center">
							<a href="#" class="btn btn-primary px-4 py-3">Get Offer</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-8 text-center heading-section ftco-animate">
					<span class="subheading">Blog</span>
					<h2 class="mb-4">Recent Blog</h2>
					<p>Separated they live in. A small river named Duden flows by
						their place and supplies it with the necessary regelialia. It is a
						paradisematic country</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html"
							class="block-20 d-flex align-items-end justify-content-end"
							style="background-image: url('images/image_1.jpg');">
							<div class="meta-date text-center p-2">
								<span class="day">18</span> <span class="mos">September</span> <span
									class="yr">2019</span>
							</div>
						</a>
						<div class="text bg-white p-4">
							<h3 class="heading">
								<a href="#">Scary Thing That You Don’t Get Enough Sleep</a>
							</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
							<div class="d-flex align-items-center mt-4">
								<p class="mb-0">
									<a href="#" class="btn btn-primary">Read More <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0">
									<a href="#" class="mr-2">Admin</a> <a href="#"
										class="meta-chat"><span class="icon-chat"></span> 3</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html"
							class="block-20 d-flex align-items-end justify-content-end"
							style="background-image: url('images/image_2.jpg');">
							<div class="meta-date text-center p-2">
								<span class="day">18</span> <span class="mos">September</span> <span
									class="yr">2019</span>
							</div>
						</a>
						<div class="text bg-white p-4">
							<h3 class="heading">
								<a href="#">Scary Thing That You Don’t Get Enough Sleep</a>
							</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
							<div class="d-flex align-items-center mt-4">
								<p class="mb-0">
									<a href="#" class="btn btn-primary">Read More <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0">
									<a href="#" class="mr-2">Admin</a> <a href="#"
										class="meta-chat"><span class="icon-chat"></span> 3</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html"
							class="block-20 d-flex align-items-end justify-content-end"
							style="background-image: url('images/image_3.jpg');">
							<div class="meta-date text-center p-2">
								<span class="day">18</span> <span class="mos">September</span> <span
									class="yr">2019</span>
							</div>
						</a>
						<div class="text bg-white p-4">
							<h3 class="heading">
								<a href="#">Scary Thing That You Don’t Get Enough Sleep</a>
							</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
							<div class="d-flex align-items-center mt-4">
								<p class="mb-0">
									<a href="#" class="btn btn-primary">Read More <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0">
									<a href="#" class="mr-2">Admin</a> <a href="#"
										class="meta-chat"><span class="icon-chat"></span> 3</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>