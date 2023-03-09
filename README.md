# Meister

<img src="https://user-images.githubusercontent.com/92138800/207755353-c7b6ad32-55aa-4967-8cd8-f02b9d666333.png" width="200"/>
'크몽'과 '숨고' 사이트를 참고하여 만든 재능판매 홈페이지<br>
<br><br>

## :dizzy: 프로젝트 기간 
2022.10.23 ~ 2022.12.01
<br><br>

## :question: 프로젝트 기획의도 
- N잡러, 부캐 시대에 맞춘 또 다른 수익 창출을 위한 나의 재능 판매
- 코로나로 인해 자연스럽게 자리잡은 온라인과 오프라인으로 받는 코칭
- 본인이 가진 재능으로 인한 리스크없이 판매 가능
<br><br>

## :waxing_crescent_moon: 멤버소개
> 팀장 : 정승필 : 모든 페이지 <br>
> 팀원1 : 양진호 : 재능판매 게시글 상세보기, 등록하기, 결제API<br>
> 팀원2 : 김혜리 : 재능판매 페이지, 검색하기 기능, 디자인<br>
> 팀원3 : 이이수 : 커뮤니티<br>
> 팀원4 : 유홍상 : 커뮤니티<br>
> 팀원5 : 한대웅 : 마이페이지, 채팅, 리뷰
<br>

## :first_quarter_moon: 개발환경
<div align=left>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white">
      <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white">
      <img src="https://img.shields.io/badge/JavaScript-F7DF1E?flat-square&logo=JavaScript&logoColor=black">
      <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white">
      <br>
      <img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=black">
      <img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=black">
      <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat-square&logo=Apache Tomcat&logoColor=black">
      <br>
      <img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=Eclipse IDE&logoColor=white">
      <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat-square&logo=Visual Studio Code&logoColor=white">
</div>
<br>

## :waxing_gibbous_moon: 코드리뷰
Dao의 일부분<br>
```
// 판매게시판 메인 리스트와 페이징처리
public ArrayList<SellBoard> selectSellBoardList(Connection conn, PageInfo pi , int local_no, int interest_no ){

  ArrayList<SellBoard> list = new ArrayList<>();

  PreparedStatement psmt = null;
  ResultSet rset = null;
  String sql = prop.getProperty("selectSellBoardList");
  if(local_no == 0) {
    sql = sql.replace("$1", "");
  }else {
    sql = sql.replace("$1", "AND LOCAL_NO = ?");
  }
  if(interest_no == 0) {
    sql = sql.replace("$2", "");
  }else {
    sql = sql.replace("$2", "AND INTEREST_NO = ?");
  }

  try {
  psmt = conn.prepareStatement(sql);

  int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
  int endRow = startRow + pi.getBoardLimit() -1;

  int i =1;

  if(local_no != 0 && interest_no != 0) {
    psmt.setInt(i++, local_no);
    psmt.setInt(i++, interest_no);	
  }else if(local_no != 0){
    psmt.setInt(i++, local_no);
  }else if(interest_no != 0){
    psmt.setInt(i++, interest_no);
  }

  psmt.setInt(i++, startRow);
  psmt.setInt(i++, endRow);

  rset = psmt.executeQuery();

  while(rset.next()) {
    list.add(new SellBoard(rset.getInt("SELL_NO"),
                rset.getString("SELL_TITLE"),
                rset.getInt("PRICE"),
                rset.getInt("SELL_RECOMMEND"),
                rset.getDate("SELL_DATE"),
                rset.getInt("INTEREST_NO"),
                rset.getInt("LOCAL_NO"),
                rset.getString("NICKNAME"),
                rset.getString("TITLEIMG"),
                rset.getString("LOCAL_NAME"),
                rset.getString("INTEREST_NAME")));
  }
} catch (SQLException e) {
  e.printStackTrace();
}finally {
  close(rset);
  close(psmt);
}
  return list;

}
```
<br>

mapper 의 일부분
```
<!-- 판매게시판 메인 리스트 조회와 페이징처리 -->
<entry key="selectSellBoardList">
SELECT *
FROM (SELECT ROWNUM RNUM,
    A.*
    FROM  (SELECT  S.SELL_NO AS SELL_NO,
                S.SELL_TITLE AS SELL_TITLE,
                S.PRICE AS PRICE,
                S.SELL_RECOMMEND AS SELL_RECOMMEND,
                S.SELL_DATE AS SELL_DATE,
                INTEREST_NO AS INTEREST_NO,
                LOCAL_NO AS LOCAL_NO,
                M.NICKNAME AS NICKNAME,
                FILE_PATH || CHANGE_NAME AS TITLEIMG,
                USER_NO,
                LOCAL_NAME,
                INTEREST_NAME
        FROM SELL S
        JOIN MEMBER M USING (USER_NO)
        JOIN ATTACHMENT A ON (A.REF_NO = S.SELL_NO)
        JOIN INTEREST I USING (INTEREST_NO)
                  JOIN LOCAL L USING (LOCAL_NO)
        WHERE S.STATUS = 'Y' AND FILE_LEVEL=2
        $1
        $2
        ORDER BY SELL_DATE DESC) A
    )
  WHERE RNUM BETWEEN ? AND ?
</entry>
```
<br>

## :full_moon: 주요기능
<table>
<tr>
	<th>
		메인페이지
	</th>
	<th>
		관리자페이지
	</th>

</tr>
<tr>
	<td>
		<img src="https://user-images.githubusercontent.com/92138800/210165689-6d9f4dd2-7f13-49ac-a173-e0a0cdba8d6a.gif" width="300" height="300"/>
	</td>
	<td>
		<img width="400" alt="21 오후 8 33 32" src="https://user-images.githubusercontent.com/92138800/210169348-cbe05bc1-951a-4b56-a534-e34f517e7768.png"></td>

</tr>
<tr>
	<th width="300px">
		판매페이지 등록하기
	</th>
	<th width="300px">재능구매하기</th>
</tr>
<tr>
	<td>
		 <img src="https://user-images.githubusercontent.com/92138800/210165899-16244e1b-270a-43c8-874c-99f97c074445.gif"width="300" height="300" />
	</td>
	<td>
		<img src="https://user-images.githubusercontent.com/92138800/210167826-976fa00b-6007-4333-8c01-6e65632749ee.gif" width="300" height="300" />
	</td>
</tr>
<tr>
	<th>커뮤니티
	</th>
	<th>
		공지사항
	</th>
</tr>
<tr>
	<td>
	<img src="https://user-images.githubusercontent.com/92138800/210168154-c192d7a0-d7eb-46f3-ad1c-6de904b406c8.gif" width="300" height="300" />
	</td>
	<td>
	<img width="300" alt="1" src="https://user-images.githubusercontent.com/92138800/210169255-5fd67eb7-fb57-4f9d-8077-20781867d027.png">
	</td>
<tr>
</table>




___
***
