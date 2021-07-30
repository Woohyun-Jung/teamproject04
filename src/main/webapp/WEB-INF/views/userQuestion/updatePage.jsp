<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <section>
    <div class="container">
        <div class="row">
            <div class="update-all">
                
                <!-- 왼쪽 영역-------------------------------- -->
                <div class="update-left-box">
                    <ul class="update-ul-box">
                        <li><a href="faqList">FAQ고객센터</a></li>
                        <li><a href="mtomPage">1:1문의내역</a></li>
                        <li><a href="../user/mypage">마이페이지</a></li>
                    </ul>
                </div>
                <!-- 오른쪽 영역------------------------------ -->
                <form action="updateForm" method="post">
                <div class="update-right-box">
                    <div class="update-question-sector"><!-- 문의 등록 영역 -->
                        <div class="update-question-title-box"> <!-- 문의 데이터 제목 -->
                            <div><!-- 작성일-->
                                <p>작성일</p>
                            </div>

                            <div><!-- 글 번호 -->
                                <p>글 번호</p>
                            </div>

                            <div class="update-question-kinds"> <!-- 문의 분류 -->
                              <p>문의 분류</p>
                              <span>(필수)</span>
                           </div>

                           <div class="update-question-id"> <!-- 아이디 -->
                                <p>아이디</p>
                           </div>
                        
                           <div class="update-question-title"> <!-- 제목 -->
                            <p>제목</p>
                            <span>(필수)</span>
                           </div>
                        
                           <div class="update-question-content"> <!-- 내용 -->
                              <p>내용</p>
                              <span>(필수)</span>
                           </div>
                        </div>

                        <div class="update-input-kinds"><!-- 문의 데이터 input 내용 -->
                            <div><!-- 작성일-->
                                <p>${update.insertDate}</p>
                            </div>

                            <div><!-- 글 번호 -->
                               <input name="insertBno" value="${update.insertBno}">
                            </div> 

                            <div> <!-- 문의 분류 -->
                                <select name="insertKind">
                                    <option value="계정 관련">계정 관련</option>
                                    <option value="결제/배송/환불">결제/배송/환불</option>
                                    <option value="상품 문제관련">상품 문제관련</option>
                                    <option value="기타사항">기타사항</option>
                                </select>
                            </div>
                         
                            <div class="update-input-id"> <!-- 아이디 -->
                                 <input type="text" name="insertId" value="${update.insertId}">
                            </div>
                         
                            <div class="update-input-title"> <!-- 제목 -->
                               <input type="text" name="insertTitle" value="${update.insertTitle}">
                            </div>
                         
                            <div class="update-input-content"> <!-- 내용 --> <!--ckeditor로 sts에서 사용할것임-->
                               <textarea class="insert-input-text" name="insertContent" name="" rows="15" cols="100" wrap="hard">${update.insertContent}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="update-file-puls-sector"><!-- 첨부파일 영역 -->
                        <div class="update-file-icon"><!-- 파일첨부! 글-->
                            <p>이미지 파일 추가</p>
                        </div>

                        <div class="update-file-funtion-box"> <!--파일 첨부 기능 영역-->
                            <div class="update-file-funtion"><!-- 파일 첨부하기-->
                                <!--input box-->
                                 <input type="text" class="upload_text" readonly="readonly" name="insertImg" value="${update.insertImg}">
                                <!--button-->
                                <div class="update-upload-btn_wrap">
                                <button type="button" title="파일선택">
                                <span>파일 선택</span>  
                                </button>
                                <input type="file" class="update-input_file" title="파일선택">
                                </div>
                            </div>
                            <div class="update-file-funtion-warning"><!-- 파일첨부 경고문-->

                            </div>
                        </div>
                    </div>

                    <!-- 문의하기 취소하기 버튼-->
                    <div class="update-btn-qne">
                        <button type="button" class="update-btn-right btn btn-default" onclick="location.href='mtomPage'">취소하기</button>
                        <button type="submit" class="update-btn-left btn btn-primary">수정하기</button>
                    </div>

                </div>
                </form>
            </div>
        </div>
    </div>
    </section>

    <!-- 파일추가 js -->
    <script>
        	$(function(){
                $('.upload_text').val('파일경로표시');
                $('.input_file').change(function(){
                    var i = $(this).val();
                    $('.upload_text').val(i);
                });
            });
    </script>