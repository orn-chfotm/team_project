<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Start header -->
<jsp:include page="includes/head.jsp"/>
<jsp:include page="includes/header.jsp"/> 
<!-- End header -->
<!-- content -->
<div class="wrap">
	<div class="content-box container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading panel-info">
	                    <h3 style="display: inline-block;">인기 모임</h3>
						<input type="button" class="pull-right btn btn-info" value="더보기">
	                </div>
	                
	                <div class="panel-body">
						<div id="popularCarousel" class="carousel slide" data-ride="carousel">

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach var="popular" items="${popularList}" varStatus="status">
										<c:if test="${status.index < 4}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
								<div class="item">
									<c:forEach var="popular" items="${popularList}" varStatus="status">
										<c:if test="${status.index > 3}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
							</div>

							<!-- Left and right controls -->
							
							<a class="left carousel-control" href="#popularCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#popularCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a> 
							
						</div>
					</div>
					<!-- panel body -->
					
				</div> 
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			
				<div class="panel panel-default">
				
					<div class="panel-heading panel-info">
	                    <h3 style="display: inline-block;">스터디 모임</h3>
						<input type="button" class="pull-right btn btn-info" value="더보기">
	                </div>
	                
	                <div class="panel-body">
						<div id="studyCarousel" class="carousel slide" data-ride="carousel">
	
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach var="popular" items="${studyList}" varStatus="status">
										<c:if test="${status.index < 4}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
								<div class="item">
									<c:forEach var="popular" items="${studyList}" varStatus="status">
										<c:if test="${status.index > 3}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
							</div>

							<!-- Left and right controls -->
							
							<a class="left carousel-control" href="#studyCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#studyCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a> 
							
						</div>
					</div>
					<!-- panel body -->
				</div> 
			</div>
		</div>
		<!-- end row -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			
				<div class="panel panel-default">
				
					<div class="panel-heading panel-info">
	                    <h3 style="display: inline-block;">운동 모임</h3>
						<input type="button" class="pull-right btn btn-info" value="더보기">
	                </div>
	                
	                <div class="panel-body">
						<div id="popularCarousel" class="carousel slide" data-ride="carousel">

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach var="popular" items="${exerciseList}" varStatus="status">
										<c:if test="${status.index < 4}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
								<div class="item">
									<c:forEach var="popular" items="${exerciseList}" varStatus="status">
										<c:if test="${status.index > 3}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
							</div>

							<!-- Left and right controls -->
							
							<a class="left carousel-control" href="#popularCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#popularCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a> 
							
						</div>
					</div>
					<!-- panel body -->
					
				</div> 
			</div>
		</div>
		<!-- End row -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			
				<div class="panel panel-default">
				
					<div class="panel-heading panel-info">
	                    <h3 style="display: inline-block;">클래스 모임</h3>
						<input type="button" class="pull-right btn btn-info" value="더보기">
	                </div>
	                
	                <div class="panel-body">
						<div id="popularCarousel" class="carousel slide" data-ride="carousel">

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach var="popular" items="${classList}" varStatus="status">
										<c:if test="${status.index < 4}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
								<div class="item">
									<c:forEach var="popular" items="${classList}" varStatus="status">
										<c:if test="${status.index > 3}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
							</div>

							<!-- Left and right controls -->
							
							<a class="left carousel-control" href="#popularCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#popularCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a> 
							
						</div>
					</div>
					<!-- panel body -->
					
				</div> 
			</div>
		</div>
		<!-- End row -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			
				<div class="panel panel-default">
				
					<div class="panel-heading panel-info">
	                    <h3 style="display: inline-block;">봉사 모임</h3>
						<input type="button" class="pull-right btn btn-info" value="더보기">
	                </div>
	                
	                <div class="panel-body">
						<div id="popularCarousel" class="carousel slide" data-ride="carousel">

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach var="popular" items="${volunteerList}" varStatus="status">
										<c:if test="${status.index < 4}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
								<div class="item">
									<c:forEach var="popular" items="${volunteerList}" varStatus="status">
										<c:if test="${status.index > 3}">
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="panel panel-box panel-default" style="cursor: pointer;"
													onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
													<div class="panel-heading" id="boardImage">
														<c:choose>
															<c:when test="${popular.meet_type eq '운동'}">
																<img src="/resources/img/defautImage/sport.png">
															</c:when>
															<c:when test="${popular.meet_type eq '클래스'}">
																<img src="/resources/img/defautImage/class.png">
															</c:when>
															<c:when test="${popular.meet_type eq '봉사'}">
																<img src="/resources/img/defautImage/service.png">
															</c:when>
															<c:otherwise>
																<img src="/resources/img/defautImage/study.png">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="panel-body paddingTop-10">
														<h5 class="fw-bolder">
															<c:out value="${popular.meet_title}"></c:out>
														</h5>
													</div>
													<div class="panel-footer paddingTop-10">
														<c:out value="${popular.meet_type}"></c:out>
														/
														<c:out value="${popular.meet_regulation}"></c:out>
														/
														<c:out value="${popular.meet_count}"></c:out>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach> 
								</div>
							</div>

							<!-- Left and right controls -->
							
							<a class="left carousel-control" href="#popularCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#popularCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a> 
							
						</div>
					</div>
					<!-- panel body -->
				</div> 
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		var message="<c:out value='${message}'/>";
		if(message != ""){
			alert(message);
		}
	    $('.carousel').carousel({
	        interval: false
	    });
	});
</script>

<!-- footer -->
<jsp:include page="includes/footer.jsp"/>
