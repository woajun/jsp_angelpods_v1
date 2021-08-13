<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% 
if(request.getAttribute("ri") == null){ %>
	<jsp:forward page = "f_write_category_view.do"/>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 기기등록</title>
      
      <!-- Bootstrap core CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
      <link href="find.css/find.search.css" rel="stylesheet">

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
              <a class="nav-link text-white" href="../find/find.write.html">습득신고</a>
            </li>
          </ul>
          <form>
            <a type="button" class="btn btn-light me-2 text-secondary fw-bold  " href = "../member/member.login.html">로그인</a>
            <a type="button" class="btn btn-outline-light text-white " href = "../member/member.signup.html">회원가입</a>
          </form>
      </div>
    </nav>
    <div style="padding-top: 60px;"></div>


    <!-- 기기등록 -->
    <form action = "f_write_category_action.do" method = "post">
      <div class="container my-3">
        <div class="text-center">
          <h1>어떤 물건을 습득하셨습니까?</h1>
        </div>
      </div>
      <div class="container">
        <div class="form-control">
          <div class="row justify-content-center">
            <div class="col-lg-6 my-5">
              <!-- <div id="showZero" class="zero  ">
                <img src="../../images/model-choice.jpg">
              </div>
              <div id="showOne" class="myDiv  ">
                <img src="../../images/airpods.jpg">
              </div>
              <div id="showTwo" class="myDiv ">
                <img src="../../images/airpodsitem.jpeg">
              </div>
              <div id="showThree" class="myDiv ">
                <img src="../../images/buds2.jpg">
              </div> -->
              <div class="col-12 fw-bold">
                <label>분류 선택</label>
                <select id="cNum" name = "cNum" class="form-select">
                  <option value="0">선택</option>
                  <c:forEach items = "${cList}" var="cDto">
                  <option value="${cDto.cNum}">${cDto.name}</option>
                  </c:forEach>
                </select>
                <!-- <select id="myselection" class="form-select">
                  <option value="Zero">모델 선택</option>
                  <option value="One">에어팟 프로</option>
                  <option value="Two">에어팟</option>
                  <option value="Three">삼성 버즈</option>
                </select> -->
                <label>세부 분류</label>
                <select id="cdNum" name="cdNum" class="form-select">
                  <option value="0">선택</option>
                  <c:forEach items = "${cdList}" var="cdDto">
                  <option class ="cdItems" value="${cdDto.cdNum}" label="${cdDto.name}" hidden="true">${cdDto.cNum}/${cdDto.needSN}</option>
                  </c:forEach>
                </select>

                <div id="divSN" style="display: none;">
                <label>일련번호</label>
                  <input class="form-control" type = "text" id = "sn" name = "sn" size = "50"><br/>
              </div>
              </div>
              <div class ="row my-2">
                  <div class = "col-12 text-center">
                    <div class="d-grid gap-2 col-6 mx-auto mt-2">
                      <input class="btn btn-dark" type="submit" value = "제출"></button>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
    
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src = "find.js/find.search.js"></script>
    <script>
    $("#cNum").on('change', function(){
        var cdItems = document.getElementsByClassName("cdItems");
        var selectedCNum = document.getElementById("cNum").value;
        $('#cdNum').val("0");
        $("#divSN").hide();
        var sn = document.getElementById("sn");
        sn.value="";

        for (let i = 0; i < cdItems.length; i++) {
          cdItems[i].setAttribute("hidden","true");
        }

        for (let i = 0; i < cdItems.length; i++) {
          if(cdItems[i].innerHTML.split('/')[0] == selectedCNum){
            cdItems[i].removeAttribute("hidden");
          }
        }
      });

      $("#divSN").hide();

      $("#cdNum").on('change', function(){
        var cdNumVal = document.getElementById("cdNum").value;
        var cdItems = document.getElementsByClassName("cdItems");

        for (let i = 0; i < cdItems.length; i++) {
          if(cdItems[i].value == cdNumVal){
            if(cdItems[i].innerHTML.split('/')[1] == 'y'){
              //일련번호 나타내기
              $("#divSN").show();
            } else {
              //일련번호 숨기기
              $("#divSN").hide();
              var sn = document.getElementById("sn");
              sn.value="";
            }
          } 
        }
      });
    </script>
</body>
</html>