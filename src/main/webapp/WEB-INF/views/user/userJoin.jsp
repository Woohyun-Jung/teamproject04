<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<style>
		#userPw.aaa:focus, #birthDay.aaa:focus, #userEmail.aaa:focus, #emailAuth.aaa:focus{
			border-color:red;
		}
		#userPw.bbb:focus, #birthDay.bbb:focus, #userEmail.bbb:focus, #emailAuth.bbb:focus{
			border-color:#66afe9;			
		}
		
		.bbb{
			background-color:rgb(232, 240, 254);
		}
	</style>
	
    <section>

    <div class="container">

      <div class="userJoin row">

        <div class="joinForm">

          <div class="joinTitle">
            <h2>회원가입</h2>
          </div>
          <form action="#" method="POST" name="#">

            <div class="joinForm-wrap form-group">
              <label for="id">아이디</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="userId" id="userId" placeholder="영문숫자 포함 6~15자">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="idCheck" class="btn btn-info">아이디중복체크</button>
                </div>
              </div>
              <span id="msgId"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="password">비밀번호</label>  
              <input type="password" class="joinForm-inner form-control" name="userPw" id="userPw" placeholder="영문 숫자 기호 포함 8~16자"> 
              <span id="msgPw"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="passwordCheck">비밀번호확인</label>
              <input type="password" class="joinForm-inner form-control" id="pwCheck">
              <span id="msgPwCheck"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="name">이름</label>
              <input type="text" class="joinForm-inner form-control" name="userName" id="userName">
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="userNickName">닉네임</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="nickName" id="nickName" placeholder="">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="nickNameCheck" class="btn btn-info">닉네임중복체크</button>
                </div>
              </div>
              <span id="msgNickName"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="nicName">생년월일</label>
              <input type="text" class="joinForm-inner form-control" name="birthDay" id="birthDay" placeholder="ex:19950623">
              <span id="msgBirthDay"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="email">이메일</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="userEmail" id="userEmail" placeholder="">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="userEmailCheck" class="btn btn-info">이메일인증</button>
                </div>
              </div>
              	<span id="msgUserEmail"></span>
              	
              <div class="emailAuthWrap" id="emailAuthWrap" style="display:none;">
              	<input type="text" class="joinForm-inner form-control" name="emailAuth" id="emailAuth" placeholder="인증번호를 입력해주세요.">
              	<span id="msgEmailAuth"></span>
              </div>             
            </div>
      
            <div class="joinForm-wrap form-group">
              <label for="phoneNum">전화번호</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="userCellNum" id="userCellNum" placeholder="-없이 입력해주세요">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="" class="btn btn-info">본인확인</button>
                </div>
              </div>              
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="address">주소</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" id="addrZipNum" name="addrZipNum" placeholder="우편번호" readonly>
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="findAddr" class="btn btn-info">우편번호찾기</button>
                </div>
              </div>
              <div class="joinForm-wrap form-group">
                <input type="text" class="joinForm-inner form-control" id="addrBasic" name="addrBasic" placeholder="기본주소">
              </div>
              <div class="joinForm-wrap form-group">
                <input type="text" class="joinForm-inner form-control" id="addrDetail" name="addrDetail" placeholder="상세주소">
              </div>
            </div>

            <div class="joinForm-wrap form-group">
              <button type="submit" class="btn btn-lg btn-info btn-block" id="joinBtn">회원가입</button>
            </div>
            
            <div class="joinForm-wrap form-group">
              <button type="button" class="btn btn-lg btn-success btn-block" onclick="location.href='../'">돌아가기</button>
            </div>


          </form>

        </div>

      </div>

    </div>

  </section>
  
	<script>
  		
		//아이디  중복체크
		$("#idCheck").click(function(){
		
			var userId = $("#userId").val();
			
			if(userId == '' || userId.length < 6 || userId.length > 15){//아이디 형식검사
				alert("아이디는 영문숫자 포함 6~15글자입니다.");
				$("#userId").focus();
				return;
			}
			
			$.getJSON("idCheck/"+userId, function(data){ //$.getJSON(요청주소, 콜백함수) 데이터조회는 주로 get방식을 사용한다고함.
				if(data == 1){//중복된 아이디가 있는 경우
					$("#msgId").html("중복된 아이디가 있습니다.");
				}else{ //중복된 아이디가 없는 경우
					$("#msgId").html("사용가능한 아이디입니다.");
					$("#userId").attr("readonly",true);
				}
			})
			
		})
		
		
		 //비밀번호 형식검사
	     var pwRegex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	      
	      $("#userPw").keyup(function(){         
	    	  
	    	  pwCheck();
	    	  
	    	  if( $("#userPw").val().length != 0 && ($("#userPw").val().length < 8 || $("#userPw").val().length > 16) ){            
	            if(! $("#userPw").hasClass("aaa") ){
	               $("#userPw").addClass("aaa");
	            }
	            if( $("#userPw").hasClass("bbb") ){
	               $("#userPw").removeClass("bbb");
	            }            
	            $("#msgPw").html("비밀번호는 8~16자로 입력하셔야 합니다.");            
	         }else if( $("#userPw").val().length != 0 && !pwRegex.test( $("#userPw").val() )){            
	            if(! $("#userPw").hasClass("aaa") ){
	               $("#userPw").addClass("aaa");
	            }if( $("#userPw").hasClass("bbb") ){
	               $("#userPw").removeClass("bbb");
	            }            
	            $("#msgPw").html("비밀번호는 영문,숫자,특수문자를 반드시 포함해야합니다.");            
	         }else if($("#userPw").val().length == 0){            
	            if( $("#userPw").hasClass("aaa") ){
	               $("#userPw").removeClass("aaa");
	            }
	            if(!$("#userPw").hasClass("bbb") ){
	               $("#userPw").addClass("bbb");
	            }
	            $("#msgPw").html("");    
	         }else{
	        	if( $("#userPw").hasClass("aaa") ){
		        	$("#userPw").removeClass("aaa");
		        }
		        if(!$("#userPw").hasClass("bbb") ){
		        	$("#userPw").addClass("bbb");
		        }
		       
		        $("#msgPw").html("사용가능한 비밀번호 입니다.");
	         }
		})
		
		//비밀번호 확인 검사	
		$("#pwCheck").keyup(function(){
			pwCheck();		
		})
		
		//비밀번호 확인 검사
		function pwCheck(){
			if( $("#userPw").val() != $("#pwCheck").val()){
					
				$("#pwCheck").css("borderColor","red");
				
			 	$("#msgPwCheck").html("확인 비밀번호가 일치하지 않습니다.");
			 	
			 	if($("#pwCheck").hasClass("bbb")){
			 		$("#pwCheck").removeClass("bbb");
			 	}
			 	
			}else if($("#userPw").val().length == 0){
				$("#msgPwCheck").html("");
				$("#pwCheck").css("borderColor","#ccc");
				
				if($("#pwCheck").hasClass("bbb")){
			 		$("#pwCheck").removeClass("bbb");
			 	}
				
			}else{				
				$("#pwCheck").css("borderColor","#ccc");	
				$("#msgPwCheck").html("확인 비밀번호가 일치합니다.");
			
				if(! $("#pwCheck").hasClass("bbb")){
			 		$("#pwCheck").addClass("bbb");
			 	}
			
		}
	}
		
	  //닉네임중복체크
      $("#nickNameCheck").click(function(){
         
         var nickName = $("#nickName").val();
         
         if(nickName.length == 0){
        	alert("닉네임은 공백이 될 수 없습니다.");
        	$("#nickName").focus();
        	return;
         }
         
         $.getJSON("nickNameCheck/"+nickName,function(data){
            if(data == 1){//중복된  경우
               $("#msgNickName").html("중복된 닉네임이 있습니다.");
               $("#nickName").css("borderColor","red");
            }else{ 
               $("#msgNickName").html("사용가능한 닉네임입니다.");
               $("#nickName").css("borderColor","#66afe9");
               $("#nickName").attr("readonly",true);
            }
         })
         
      })
      
	//생년월일 형식검사
	var birthDayRegex = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
	$("#birthDay").keyup(function(){
		
		if( ! birthDayRegex.test( $("#birthDay").val() )){
			
			if( ! $("#birthDay").hasClass("aaa") ){
				$("#birthDay").addClass("aaa");
			}
			
			if( $("#birthDay").hasClass("bbb") ){
				$("#birthDay").removeClass("bbb");
			}
			
			$("#msgBirthDay").html("생년월일 입력 형식을 확인해주세요.");
		}else{
			if( !$("#birthDay").hasClass("bbb") ){
				$("#birthDay").addClass("bbb");
			}
			if( $("#birthDay").hasClass("aaa") ){
				$("#birthDay").removeClass("aaa");
			}
			$("#msgBirthDay").html("");
		}
	})
	
	
	//주소 팝업 
	$("#findAddr").click(function(){
		var pop = window.open("${pageContext.request.contextPath}/resources/pop/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	})
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		//기본주소
		$("#addrBasic").val(roadAddrPart1);
		//고객입력상세주소
		$("#addrDetail").val(addrDetail);
		//우편번호
		$("#addrZipNum").val(zipNo);
		
	}
	
	//이메일 형식검사
	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	$("#userEmail").keyup(function(){
		if( ! emailRegex.test( $("#userEmail").val() )){			
			if( ! $("#userEmail").hasClass("aaa") ){
				$("#userEmail").addClass("aaa");
			}		
			if( $("#userEmail").hasClass("bbb") ){
				$("#userEmail").removeClass("bbb");
			}			
			$("#msgUserEmail").html("이메일 입력 형식을 확인해주세요.");
		}else{
			if( !$("#userEmail").hasClass("bbb") ){
				$("#userEmail").addClass("bbb");
			}
			if( $("#userEmail").hasClass("aaa") ){
				$("#userEmail").removeClass("aaa");
			}
			$("#msgUserEmail").html("");
		}
	})
	
	//이메일 중복검사 및 인증		
	$("#userEmailCheck").click(function(){//	
		
		if(! $("#userEmail").hasClass("bbb") ){ //bbb클래스를 가지고 있지 않다면 email형식이 올바르지 않다고 판단 메서드를 종료시킨다.
			alert("이메일 형식을 확인해주세요");
			return;
		}
		
		var userEmail = $("#userEmail").val();
	
		$.ajax({
			type: "post",
			url: "emailCheck",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({"userEmail":userEmail}),
			success: function(data){
				if(data == 1){//email중복
					alert("이미 가입된 유저의 이메일입니다. ");
					return;
				}else{//Email중복이 아닐경우
					alert("입력하신 이메일로 인증번호가 발송되었습니다.");
					$("#userEmail").attr("readonly",true);
					$("#emailAuthWrap").css("display","block");
					$("#emailAuthWrap").focus();
					
					//이메일발송
					$.ajax({
						type: "post",
						url: "sendEmail",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify({"userEmail":userEmail}),
						success: function(data){
							
							var keyCode = data.keyCode	
							$("#emailAuth").keyup(function(){
								if( $("#emailAuth").val() != keyCode){
									if( !$("#emailAuth").hasClass("aaa") ){
										$("#emailAuth").addClass("aaa");
									}
									if( $("#emailAuth").hasClass("bbb") ){
										$("#emailAuth").removeClass("bbb");
									}
									$("#msgEmailAuth").html("인증번호를 확인해주세요");
								}else{
									if( !$("#emailAuth").hasClass("bbb") ){
										$("#emailAuth").addClass("bbb");
									}									
									if( $("#emailAuth").hasClass("aaa") ){
										$("#emailAuth").removeClass("aaa");
									}
									$("#msgEmailAuth").html("인증번호가 일치합니다");
								}
							})
						},
						error: function(status,error){
							console.log(status,error);							
						}
					})
					
				}
			},
			error: function(status,error){
				console.log(status, error);
			}
		})
			
	  /*$.getJSON("emailCheck/"+userEmail, function(data){
			console.log("data값:"+data);
		})  왜안되는지 모르겠음*/	
	
	})//end 

		
	</script>