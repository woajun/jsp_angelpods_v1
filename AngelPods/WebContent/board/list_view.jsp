<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% 
if(request.getAttribute("f_list") == null){ %>
	<jsp:forward page = "f_list.do"/>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- booststrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link href="board.css/list_view.css" rel="stylesheet">
    <script type="text/javascript" src="board.js/list_view.js"></script>
	
</head>
<body>


    <!-- nav -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top px-3" >
      <a class="navbar-brand" href="../index.html">Angel Pods</a>
      <div>
        <button class="navbar-toggler collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        
          <span class="navbar-toggler-icon"></span>

        </button>
        <button type="button btn-list-map" class=" navbar-toggler" id="sidebarToggle">
          <svg xmlns="http://www.w3.org/2000/svg" width="28" height="30" fill="currentColor" class="bi bi-map-fill" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"></path>
          </svg>
          지도보기
        </button>
      </div>
      
      <div class="navbar-collapse collapse" id="navbarsExample03">
          <ul class="navbar-nav me-auto mb-2 mb-sm-0">
            <li class="nav-item">
              <a class="nav-link text-white" href="../regist/regist.new.html">기기등록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="../find/find.list.html">게시글보기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="../member/member.mypage.html">분실신고</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="../find/find.search.html">습득신고</a>
            </li>
          </ul>
          <form>
            <a type="button" class="btn btn-light me-2 text-secondary fw-bold  " href = "../member/member.login.html">로그인</a>
            <a type="button" class="btn btn-outline-light text-white " href = "../member/member.signup.html">회원가입</a>
          </form>
      </div>
    </nav>
    
    <!--지도-->
    <div id="map" style="width:100%;height:100vh; position: fixed;"></div>
    
    <!-- 
	<table width ="500" cellpadding = "0" cellspacing = "0" border = "1">
		<form action = "" method = "post">
			<tr>
	        	<td>조회유형</td>
	        	<td>
	                  <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off" checked>
	                  <label class="btn btn-outline-secondary" for="option2">습득물</label>
	                  <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
	                  <label class="btn btn-outline-secondary" for="option3">분실물</label>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
		        	<select id="cNum" name = "cNum">
				        <option value="0">분류 선택</option>
				        <option value="1">무선이어폰</option>
				        <option value="2">지갑</option>
				        <option value="3">카드</option>
			          	<option value="4">애완동물</option>
			        </select>
			        <select id="cdNum" name = "cdNum">
			            <option value="0">분류 상세</option>
			            <option value="1">애플-에어팟1,2세대</option>
			            <option value="2">애플-에어팟 프로</option>
			            <option value="3">삼성-버즈</option>
			        </select>
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					TODO 1. 행정동 검색기능 2. 현재 위치 행정동
	            </td>
			</tr>
			<tr>
				<td colspan ="2" >
					<input type = "submit" value = "검색" >
				</td>
			</tr>
		</form>
	</table>
	<br/> -->
	
	<!-- 검색내용 -->
    <div class="portfolio-modal modal fade " id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="container">
            <div class="row modal-body ">

              <h2>필터</h2>
                <div class = "col-12 py-1">
                	조회유형
                </div>
                <div class = "col-4 d-grid ">
                  <input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
                  <label class="btn btn-outline-secondary" for="option1">전체</label>
                </div>
                <div class = "col-4 d-grid ">
                  <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
                  <label class="btn btn-outline-secondary" for="option2">습득물</label>
                </div>
                <div class = "col-4 d-grid ">
                  <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
                  <label class="btn btn-outline-secondary" for="option3">분실물</label>
                </div>

                <div class = "col-12 py-1">
                	모델
                </div>
                <div class = "col-6 d-grid my-1">
                <input type="checkbox" class="btn-check" name="model" id="mod1" autocomplete="off" checked>
                <label class="btn btn-outline-secondary" for="mod1">전체</label>
                </div>
                <div class = "col-6 d-grid my-1">
                <input type="checkbox" class="btn-check" name="model" id="mod2" autocomplete="off">
                <label class="btn btn-outline-secondary" for="mod2">에어팟</label>
                </div>
                <div class = "col-6 d-grid my-1">
                <input type="checkbox" class="btn-check" name="model" id="mod3" autocomplete="off">
                <label class="btn btn-outline-secondary" for="mod3">에어팟 프로</label>
                </div>
                <div class = "col-6 d-grid my-1">
                <input type="checkbox" class="btn-check" name="model" id="mod4" autocomplete="off">
                <label class="btn btn-outline-secondary" for="mod4">갤럭시 버즈</label>
                </div>

                <div class = "col-12 py-1">
                  	지역
                </div>
                <div class = "col-12 py-1">
                  <select name="sido1" id="sido1" class ="form-select"></select>
                  <select name="gugun1" id="gugun1" class ="form-select mt-1"></select>
                </div>

                <div class = "col-12 py-1">
                  	키워드 검색
                </div>
                <div class = "col-12 py-1">
                  <input type="text" class="form-control" placeholder="입력" aria-label="Input group example" aria-describedby="basic-addon1">
                </div>

                <div class = "col-12 py-1">
                  <button class="btn btn-primary d-grid col-12" data-bs-dismiss="modal" type="button">
                      <i class="fas fa-times me-1"></i>
                      	검색하기
                  </button>
                </div>
                


            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    <!-- 게시판 -->
    <div id="layoutSidenav" >
      <div id="layoutSidenav_nav" class = "bg-light border-end border-5">
        <!-- 검색리스트 -->
        <section class = "py-1"> 
          <div class="container bg-white">
            <div class="row">
              <!-- 검색조건 -->
                <div class = "col-6 d-grid ">
                  <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
                  <label class="btn btn-outline-secondary" for="option2">습득물</label>
                </div>
                <div class = "col-6 d-grid ">
                  <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
                  <label class="btn btn-outline-secondary" for="option3">분실물</label>
                </div>
              <div class="text-center">
                <div class = "py-2 mx-3 pb-4">
                  <div class="input-group w-100" data-bs-toggle="modal" href="#portfolioModal1">
                    <span class="input-group-text" id="basic-addon1">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                      <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                      </svg>
                    </span>
                    <input type="text" class="form-control" placeholder="검색 조건을 설정해주세요" aria-label="Input group example" aria-describedby="basic-addon1">
                  </div>
                  <div class="text-start">
                    	검색조건 "전체"
                  </div>
                </div>
              </div>
              <!-- 컨텐츠 -->
              <c:forEach items = "${list}" var="dto">
	              <div class="row container ">
	                <div class= "col-4 ">
	                  <a href="f_content_view.do?fbNum=${dto.fbNum}" class="">
	                    <img  class="rounded"  src="${pageContext.request.contextPath}/images/${dto.thumbnailImage}" alt="..." width=146px height=140px>
	                  </a>
	                </div>
	                <div class= "col-8">
	                    <a href="f_content_view.do?fbNum=${dto.fbNum}" class="">
	                      <h5 class="fw-bolder h6">${dto.timestamp}</h5>
	                      <h5 class="fw-bolder h6">${dto.addr}</h5>
	                      <h5 class="fw-bolder h6">${dto.addrDetail}</h5>
	                      <h6 class="fw-normal">${dto.title}</h6>
	                      
	                      <h6 class="fw-normal h6 text-end">채팅 ${dto.chatHit}</h6>
	                    </a>
	                    </div>
	                  <div class = "my-1"><hr class="border"></div>
	              </div>
					<input type="hidden" class = "fbNum" value="${dto.fbNum}">
					<input type="hidden" class = "userId" value="${dto.userId}">
					<input type="hidden" class = "cNum" value="${dto.cNum}">
					<input type="hidden" class = "cdNum" value="${dto.cdNum}">
					<input type="hidden" class = "thumbnailImage" value="${pageContext.request.contextPath}/images/${dto.thumbnailImage}">
					<input type="hidden" class = "timestamp" value="${dto.timestamp}">
					<input type="hidden" class = "addr" value="${dto.addr}">
					<input type="hidden" class = "addrDetail" value="${dto.addrDetail}">
					<input type="hidden" class = "title" value="${dto.title}">
					<input type="hidden" class = "contents" value="${dto.contents}">
					<input type="hidden" class = "sn" value="${dto.sn}">
					<input type="hidden" class = "lat" value="${dto.lat}">
					<input type="hidden" class = "lon" value="${dto.lon}">
					<input type="hidden" class = "hit" value="${dto.hit}">
					<input type="hidden" class = "chatHit" value="${dto.chatHit}">
					<input type="hidden" class = "fState" value="${dto.fState}">
              </c:forEach> 
            </div>
          </div>
        </section>  
      </div>
    </div>
    
    <!-- 글쓰기 버튼 -->
    <div id ="btn_write" class="fixed-bottom " >
      <div class = "row text-center px-4">
        <div class ="col"></div>
        <div class ="col"></div>
        <div class ="col"></div>
        <div class ="col"></div>
        <div class ="col">
          <button type="button" data-bs-toggle="dropdown" aria-expanded="false" class="btn btn-primary btn-xl">
            글쓰기
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="../find/find.write.html">      
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
              </svg> 기기 등록</a></li>
            <li><a class="dropdown-item" href="../member/member.mypage.html">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
              </svg> 분실신고</a></li>
            <li><a class="dropdown-item" onclick = "javascript:window.location='../find/write_category_view.jsp'">      
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
              </svg> 습득물 등록</a></li>
          </ul>
        </div>
        <br>
        <br>
        <br>
      </div>
      <br>
      <br>
      <br>
    </div>

    <!-- 하단 nav -->
    <div id="bnav" class="fixed-bottom ">
      <div id ="bnav_nav" >
        <div class = "row text-center px-4">
            <div class="col position-relative">
              <button type="button" aria-expanded="false" class="btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                  <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
                </svg>
                <a href="../index.html" class="stretched-link"></a>
              </button>
            </div>

            <div class="col position-relative">
              <button type="button" aria-expanded="false" class="btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-grid-3x3-gap-fill" viewBox="0 0 16 16">
                  <path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
                </svg>
                <a href="#" class="stretched-link"></a>
              </button>
            </div>

            
            <!-- plus버튼 -->
            <div class="col position-relative">
              <button type="button" data-bs-toggle="dropdown" aria-expanded="false" class="btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
                </svg>
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../regist/regist.new.html">      
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  </svg> 기기 등록</a></li>
                <li><a class="dropdown-item" href="../member/member.mypage.html">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  </svg> 분실신고</a></li>
                <li><a class="dropdown-item" onclick = "javascript:window.location='../find/write_category_view.jsp'">      
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  </svg> 습득물 등록</a></li>
              </ul>
            </div>


            <div class="col position-relative">
              <button type="button" aria-expanded="false" class="btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                </svg>
                <a href="lost-list/lostlist.html" class="stretched-link"></a>
              </button>
            </div>



            <div class="col position-relative">
              <button type="button" aria-expanded="false" class="btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                <a href="../member/member.mypage.html" class="stretched-link"></a>
              </button>
            </div>


        </div>
      </div>
    </div>

<%--
 		<c:forEach items = "${list}" var="dto">
		<tr>
			<td><a class = "fbNum" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.fbNum}</a></td>
			<td><a class = "userId" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.userId}</a></td>
			<td><a class = "cNum" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.cNum}</a></td>
			<td><a class = "cdNum" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.cdNum}</a></td>
			
			<td><a class = "thumbnailImage" href = "f_content_view.do?fbNum=${dto.fbNum}">
 			<img src = "${directory}${dto.thumbnailImage}" width=73px height=70px></a></td>
			<img src = "${pageContext.request.contextPath}/IMAGES/${dto.thumbnailImage}" width=73px height=70px></a></td>

			<td><a class = "timestamp" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.timestamp}</a></td>
			<td><a class = "addr" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.addr}</a></td>
			<td><a class = "addrDetail" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.addrDetail}</a></td>
			<td><a class = "title" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.title}</a></td>
			<td><a class = "contents" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.contents}</a></td>
			<td><a class = "sn" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.sn}</a></td>
			<td><input type="hidden" class = "lat" value="${dto.lat}"></input></td>
			<td><input type="hidden" class = "lon" value="${dto.lon}"></input></td>
			<td><a class = "hit" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.hit}</a></td>
			<td><a class = "chatHit" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.chatHit}</a></td>
			<td><a class = "fState" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.fState}</a></td>
		</tr>
		</c:forEach> 
--%>
<!-- 		<tr>
			<td colspan = "16">
			<input type = "button" value = "습득물 등록" onclick = "javascript:window.location='../find/write_category_view.jsp'">
			<input type = "button" value = "메인화면" onclick = "javascript:window.location='../member/main.jsp'">
			</td>
		</tr> -->

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da"></script>
<script type="text/javascript" src="board.js/list_view_map.js"></script>
</body>
</html>