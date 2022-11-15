<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <%
       int type = Integer.parseInt(request.getParameter("type"));
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
   body, form, div, h1, h2, h3, h4, p, span{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
   }
   #wrap {
/*       background: black; */
        

        height: 800px;
        margin: auto;
          padding-top: 105px;
   }
   #wrap2{
      min-height: 700px;
   }
   #enroll-form input {
      display: block;
      width: 100%;
   }
   
   #wrap-title {
      height: 100px;
       display: block;
   }
   #wrap-title2 {
      display: flex;
       align-items: center;
       justify-content: space-between;
       width: 60.625rem;
       height: 100%;
       margin: auto;
   }
   .file{
        box-sizing: border-box;
        margin: auto;
      position: relative;
        left:240px;
        top:20px;

    }
   #file {
      display: flex;
      justify-content: center;
      height: 3.5rem;
      padding: 1rem 1.25rem;
      background-color: orange;
      margin: 0 -1rem;
      border-top: 0.0625rem solid #f4f4f4;
      border-bottom: 0.0625rem solid #f4f4f4;
   }
   
   #file2 {
      display: flex;
       align-items: center;
   }

   .file2Wrap{
      width: 1400px;
      min-width: 1400px;
      height: 100px;
      margin: 0 auto;
      position: relative;
      
   }
   .file2wrap2{
      position: absolute;
       top: 50px;
       transform: translateY(-50%);
       left: 16%;
   }
   #title {
      height: 100px;
       padding: 15px;
       display: block;
   }
   #title1 {
      display: flex;
       align-items: center;
       justify-content: space-between;
       width: 60.625rem;
       height: 100%;
       margin: auto;
       border-top: 1px solid orange;
      border-bottom: 1px solid orange;
   }
   .title {
      width: 100%;
      height: 100%;
      position: relative;
      border: 0;
      outline: none;
   }
   
   #content {
      height: 350px;
       padding: 15px;
       display: block;
   }
   
   #content2 {
      display: flex;
       align-items: center;
       justify-content: space-between;
       width: 60.625rem;
       height: 100%;
       margin: auto;
       border-top: 1px solid orange;
      border-bottom: 1px solid orange;
   }
   #content3 {
      width: 100%;
      height: 100%;
      resize: none;
      border: 0;
      outline: none;
      
   }
   .input-file-button{
      padding: 6px 25px;
      background-color:#FF6600;
      border-radius: 4px;
      color: white;
      cursor: pointer;
      margin: auto;
   }
   #camera{
      width: 30px;
      height:30px;
   }
   
   #fileName{
      padding-left:10px;
      font-size: 17px;
       font-weight: bold;
      top: 50%;
      transform: translateY(-50%);
      color: #000;
      display: block;
   }
   #btn {
      background-color: white;
      width: 100px;
      height: 45px;
       color: orange;
       outline-color: rgb(248, 162, 3);
       border: solid;
       border-radius: 12px;
   }
   #btn:hover {
      background-color: orange;
      color: white;
   }
   #img {
      display: flex;
      justify-content: center;
      width: 100%;
      margin: 0.75rem;
   }

</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>
   <div id="wrap">
      <form id="enroll-form" action="<%=contextPath %>/insert.bo" method="post" enctype="multipart/form-data" style="height: 700px; font-weight: bold;">
         <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>"> 
      <div id="wrap2">
         <div id="wrap-title">
               <div id="wrap-title2" style="font-size:1">
                  <font style="font-size: 30px; font-weight: bold;">게시글 글작성</font>
                  <button   type="submit" id="btn" style="font-size: 20px; font-weight: bold;">등록</button>
                  <input type="hidden" name="type" value="<%=type %>">   
               </div>
               <div id="file">
                  <div id="file2">
                     <label class="input-file-button" for="input-file">
                        <i id="camera" class="bi bi-camera-fill"></i>
                     </label>
                     <input type="file" id="input-file" onchange="fileChange()"style=display:none>
                     <label id="fileName"></label>
                  </div>
               </div>
      <br>
               <div id="title">
                  <div id="title1">
               <input type="text" name="title" maxlength="30" class="title" size="100" placeholder="게시글 제목을 입력헤주세요." required>
                  </div>
               </div>
               <div><hr></div>
               <div id="img">

               </div>
               <div id="content">
                  <div id="content2">
                     <textarea id="content3" maxlength="500" name="content" rows="10" placeholder="게시글 내용을 입력해주세요." required></textarea>
                  </div>
               </div>
            </div>
         </div>
      </form>
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
   
      
   <script>
      function fileChange(){
         $("#fileName").text($("#input-file")[0].files[0].name);
      }
   </script>
   
</body>
</html>