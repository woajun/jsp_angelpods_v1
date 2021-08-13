<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 회원가입</title>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">


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


    <!-- 회원가입 설명 -->


    <div class="container">
      <div class="row justify-content-center">
        <div class="py-2 text-center">
          <h2 class = "py-3">회원가입</h2>
          <p class="lead">환영합니다! 최고의 분실물 조회 서비스를 제공하기 위해 최선을 다하겠습니다.</p>
        </div>
        
        <div class="col-lg-8 ">
          <hr>
          <h4 class="mb-3">필수정보</h4>
          <form action = "join.do" id="joinForm" method = "post" name = "reg_frm" >
            <div class="row g-3">
              
              <div class="col-12">
                <label for="userId" class="form-label">ID</label>
                <input type="text" class="form-control need-validate" id="userId" name="userId" placeholder="영어,숫자 4~15자" minlength="4"maxlength="15" required>
                <div class="invalid-feedback">
                  영어 소문자와 숫자로 4자 이상, 15자 이내로 입력해주세요.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="pw" class="form-label">password</label>
                <input type="password" class="form-control pw need-validate" id="pw" name="pw" placeholder="비밀번호" minlength="4" required>
                <div class="invalid-feedback">
                  비밀번호는 4자 이상 입력해주세요.
                </div>
              </div>
          
              <div class="col-sm-6 ">
                <label for="pwChk" class="form-label">password-check</label>
                <input type="password" class="form-control pw need-validate" id="pwChk" placeholder="비밀번호 확인" value=""  required>
                <div class="invalid-feedback">
                  비밀번호가 일치하지 않습니다.
                </div>
              </div>

              <div class="col-12">
                <label for="username" class="form-label">Username</label>
                <div class="input-group has-validation">
                  <input type="text" class="form-control need-validate" id="name" name="name" placeholder="닉네임 입력" maxlength ="15" required="" >
                <div class="invalid-feedback">
                    닉네임을 입력해주세요.(2~15자)
                  </div>
                </div>
              </div>
              
              <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control need-validate" id="eMail" name = "eMail" placeholder="honggildong@example.com" required>
                <div class="invalid-feedback">
                  올바른 이메일 주소를 입력해주세요.
                </div>
              </div>
              
              <div class="col-12">
                <label for="address" class="form-label">초기 검색 위치</label>
                <!-- <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="same-address">
                  <label class="form-check-label" for="same-address">위치정보제공동의</label>
                </div> -->

                <div class="form-check mb-3">
                  <input type="checkbox" class="form-check-input" id="addrChk" onclick="addrChkFunc()" required>
                  <label class="form-check-label">위치정보제공동의<span class="text-muted"> (현재 위치를 얻기위해, 위치정보 제공에 동의해주세요)</span></label>
                </div>
                
                <div class="input-group mb-3">
                  <button class="btn btn-secondary" type="button" id="addrBtn" name = "addr" onclick="addrBtnFunc()" disabled>동네확인</button>
                  <input id="addrVO" type="text" class="form-control bg-white" placeholder="버튼을 누르면, 현재 위치가 입력됩니다." readonly>
                </div>
              </div>  

              <input type = "hidden" id ="lat" name = "lat" /><br/>
              <input type = "hidden" id ="lon" name = "lon" /><br/>

            <!-- <button class="w-100 btn btn-primary btn-lg mb-5" type="submit" onclick = "infoConform()">회원정보 등록하기</button> -->
            <input id = "submitBtn" class="w-100 btn btn-primary btn-lg mb-5" type="button" value="회원정보 등록하기">
          </form>
        </div>
      </div>
    </div>
    
        <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="member.js/join.js"></script>
</body>
</html>