<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer page</title>
</head>
<body>
<script type="text/javascript">

var previous = '';

function doDisplay(e){
	var sqval = e.value;
	var con = document.getElementById(sqval);
	con.style.display = 'block';
	var num = con.children;
	for(var i = 0; i < num.length; i++){
		num[i].disabled = false;
	}
	
	
	if(previous != ''){
		var precon = document.getElementById(previous);
		precon.style.display = 'none';
		var prenum = precon.children;
		for(var i = 0; i < prenum.length; i++){
			prenum[i].disabled = 'disabled';
		}
	}
	previous = e.value;
}
</script>
<h2>환영합니다. <%=session.getAttribute("username")%> 님</h2>
<h2>원하는 질문을 선택하세요.</h2>

<form action="cusresult.jsp">
<select name = "selectq" onchange="doDisplay(this)" style="font-size:16px;">
<option value="" selected disabled>찾아볼 내용을 선택하세요.</option>
<option value="q1_1">특정 가격의 책 제목과 그 책의 가격</option>
<option value="q2_1">특정 고객이 평가한 책과 그 평가 점수</option>
<option value="q2_2">특정 출판사에서 출판한 책 제목과 출판 년도</option>
<option value="q3_1">작가의 이름과 그 작가가 쓴 책들의 평점의 평균</option>
<option value="q3_2">각 출판사에서 출판한 책의 수가 특정 갯수 이상인 출판사의 이름과 그 수</option>
<option value="q4_2">원하는 시리즈의 책 제목과 가격</option>
<option value="q5_1">원하는 장르의 책</option>
<option value="q5_2">평가되지 않은 책</option>
<option value="q6_1">특정 작가가 쓴 책 목록</option>
<option value="q7_1">'장르'에 해당하는 '가격'보다 높은 책 제목 및 가격</option>
<option value="q7_2">'출판일'뒤에 출판한 책 중 '가격'보다 낮거나 같은 책 제목 및 가격</option>
<option value="q8_1">작가가 쓴 책 가격 정렬</option>
<option value="q8_2">책의 제목과 그 책의 가격과 출판사, 출판년도를 출판년도순으로 정렬</option>
<option value="q9_1">작가의 이름과 쓴 책 갯수 정렬</option>
<option value="q9_2">책 제목과 평점 정렬</option>
<option value="q10_1">특정 장르 중 시리즈</option>
<option value="q10_2">출판사가 출판하는 책 중 특정 장르 제외</option>
<option value="research">직접 검색하기</option>
<option value="rating">책 평가하기</option>
</select><br><br>


<div id="q1_1" style="display:none">
가격 : <input type="text" name="Q1_1Price" disabled/><br>
</div>


<div id="q2_1" style="display:none">
고객 이름 : <input type="text" name="Q2_1Customer"  disabled/><br>
</div>


<div id="q2_2" style="display:none">
출판사 : 
      <select name = "Q2_2Publisher" disabled>
      	<option value="P100" selected>이둔</option>
		<option value="P101">푸른물고기</option>
		<option value="P102">마을</option>
		<option value="P103">대현문화사</option>
		<option value="P104">한숲출판사</option>
		<option value="P105">깊은강</option>
		<option value="P106">도서출판 동문사</option>
		<option value="P107">시공사</option>
		<option value="P108">씨엔씨미디어</option>
		<option value="P109">예담</option>
		<option value="P110">프로넷</option>
		<option value="P112">고즈넉이엔티</option>
		<option value="P113">다향</option>
		<option value="P114">봄미디어</option>
		<option value="P115">살림</option>
		<option value="P116">아르테</option>
		<option value="P117">오후세시</option>
		<option value="P118">뿔(웅진)</option>
		<option value="P119">북로드</option>
		<option value="P120">열린책들</option>
		<option value="P200">해문출판사</option>
		<option value="P201">재인</option>
		<option value="P203">문학동네</option>
		<option value="P205">창비</option>
		<option value="P206">대원씨아이</option>
		<option value="P207">태일소담</option>
		<option value="P208">민음사</option>
		<option value="P209">현대문학</option>
		<option value="P210">알에이치코리아</option>
		<option value="P211">도서출판작가정신</option>
		<option value="P212">도서출판책세상</option>
		<option value="P213">루비박스</option>
		<option value="P214">에이콘출판</option>
		<option value="P215">북플라자</option>
		<option value="P216">비룡소</option>
		<option value="P217">영상출판미디어</option>
		<option value="P220">김영사</option>
		<option value="P221">도서출판아침이슬</option>
		<option value="P300">팩토리나인</option>
		<option value="P301">엘릭시르</option>
		<option value="P302">제우미디어</option>
		<option value="P303">문학수첩</option>
		<option value="P304">한스미디어</option>
		<option value="P305">북폴리오</option>
		<option value="P306">황금가지</option>
		<option value="P307">노블마인</option>
		<option value="P308">다산책방</option>
		<option value="P309">북하우스</option>
		<option value="P310">Publishment01</option>
		<option value="P311">Publishment02</option>
		<option value="P312">Publishment03</option>
		<option value="P313">Publishment04</option>
		<option value="P314">Publishment05</option>
		<option value="P315">Publishment06</option>
		<option value="P316">Publishment07</option>
		<option value="P317">Publishment08</option>
		<option value="P318">Publishment09</option>
		<option value="P319">Publishment10</option>
		<option value="P320">Publishment11</option>
		<option value="P321">Publishment12</option>
		<option value="P322">Publishment13</option>
		<option value="P323">Publishment14</option>
		<option value="P324">Publishment15</option>
		<option value="P325">Publishment16</option>
		<option value="P326">Publishment17</option>
		<option value="P327">Publishment18</option>
		<option value="P328">Publishment19</option>
		<option value="P329">Publishment20</option>
		<option value="P330">Publishment21</option>
		<option value="P331">Publishment22</option>
		<option value="P332">Publishment23</option>
		<option value="P333">Publishment24</option>
		<option value="P334">Publishment25</option>
		<option value="P335">Publishment26</option>
		<option value="P336">Publishment27</option>
		<option value="P337">Publishment28</option>
		<option value="P338">Publishment29</option>
		<option value="P339">Publishment30</option>
		<option value="P340">Publishment31</option>
		<option value="P341">Publishment32</option>
		<option value="P342">Publishment33</option>
		<option value="P343">Publishment34</option>
		<option value="P344">Publishment35</option>
		<option value="P345">Publishment36</option>
		<option value="P346">Publishment37</option>
		<option value="P347">Publishment38</option>
		<option value="P348">Publishment39</option>
		<option value="P349">Publishment40</option>
		<option value="P350">Publishment41</option>
		<option value="P351">Publishment42</option>
		<option value="P352">Publishment43</option>
		<option value="P353">Publishment44</option>
		<option value="P354">Publishment45</option>
		<option value="P355">Publishment46</option>
		<option value="P356">Publishment47</option>
		<option value="P357">Publishment48</option>
		<option value="P358">Publishment49</option>
		<option value="P359">Publishment50</option>
		<option value="P360">Publishment51</option>
		<option value="P361">Publishment52</option>
	</select><br>
</div>


<div id="q3_1" style="display:none">
Do you want to see Score Average? : 
      <input type="radio" name="ScoreAverage" value="yes" checked  disabled>Yes
      <input type="radio" name="ScoreAverage" value="no"  disabled>No<br>
</div>


<div id="q3_2" style="display:none">
숫자 : <input type="text" name="Q3_2Count"  disabled/><br>
</div>


<div id="q4_2" style="display:none">
시리즈 이름 : <input type="text" name="Seriesname" disabled><br>
</div>

<div id="q5_1" style="display:none">
장르 :
<select name="Genre1" disabled>
	<option value="G100" selected>호러.공포소설</option>
	<option value="G101">액션/스릴러소설</option>
	<option value="G102">한국시</option>
	<option value="G103">일본소설</option>
	<option value="G104">로맨스소설</option>
	<option value="G105">영미소설</option>
	<option value="G106">북유럽소설</option>
	<option value="G107">독일소설</option>
	<option value="G108">중국소설</option>
	<option value="G109">프랑스소설</option>
	<option value="G110">스페인소설</option>
	<option value="G111">이탈리아소설</option>
	<option value="G112">도서학</option>
	<option value="G113">문헌정보학</option>
	<option value="G114">백과사전</option>
	<option value="G115">강연집</option>
	<option value="G116">일반연속간행물</option>
	<option value="G117">연구기관</option>
	<option value="G118">신문</option>
	<option value="G119">일반전집</option>
	<option value="G120">향토자료</option>
	<option value="G121">화학</option>
	<option value="G122">농업</option>
	<option value="G123">공학</option>
	<option value="G124">건축</option>
	<option value="G125">기계공학</option>
	<option value="G126">전기공학</option>
	<option value="G127">화학공학</option>
	<option value="G128">제조업</option>
	<option value="G129">생활과학</option>
	<option value="G130">Genre01</option>
	<option value="G131">Genre02</option>
	<option value="G200">추리</option>
	<option value="G201">SF</option>
	<option value="G202">판타지</option>
	<option value="G203">청소년 문학</option>
	<option value="G204">형이상학</option>
	<option value="G205">인식론</option>
	<option value="G206">철학의 체계</option>
	<option value="G207">경학</option>
	<option value="G208">동양철학</option>
	<option value="G209">서양철학</option>
	<option value="G210">논리학</option>
	<option value="G211">심리학</option>
	<option value="G212">윤리학</option>
	<option value="G213">미사용</option>
	<option value="G214">조각</option>
	<option value="G215">공예</option>
	<option value="G216">서예</option>
	<option value="G217">회화</option>
	<option value="G218">사진예술</option>
	<option value="G219">음악</option>
	<option value="G220">공연예술</option>
	<option value="G221">오락</option>
	<option value="G222">비교종교</option>
	<option value="G223">불교</option>
	<option value="G224">기독교</option>
	<option value="G225">도교</option>
	<option value="G226">천도교</option>
	<option value="G227">힌두교</option>
	<option value="G228">이슬람교</option>
	<option value="G229">기타제종교</option>
	<option value="G230">Genre03</option>
	<option value="G231">Genre04</option>
	<option value="G301">한국어</option>
	<option value="G302">중국어</option>
	<option value="G303">일본어</option>
	<option value="G304">영어</option>
	<option value="G305">독일어</option>
	<option value="G306">프랑스어</option>
	<option value="G307">스페인어</option>
	<option value="G308">이탈리아어</option>
	<option value="G309">기타제어</option>
	<option value="G310">통계학</option>
	<option value="G311">경제학</option>
	<option value="G312">사회학</option>
	<option value="G313">정치학</option>
	<option value="G314">행정학</option>
	<option value="G315">법학</option>
	<option value="G316">교육학</option>
	<option value="G317">민속학</option>
	<option value="G318">군사학</option>
	<option value="G319">수학</option>
	<option value="G320">물리학</option>
	<option value="G321">화학</option>
	<option value="G322">천문학</option>
	<option value="G323">지학</option>
	<option value="G324">광물학</option>
	<option value="G325">생명과학</option>
	<option value="G326">식물학</option>
	<option value="G327">동물학</option>
	<option value="G328">아시아</option>
	<option value="G329">유럽</option>
	<option value="G330">아프리카</option>
	<option value="G331">북아메리카</option>
	<option value="G332">남아메리카</option>
	<option value="G333">오세아니아</option>
	<option value="G334">지리</option>
	<option value="G335">전기</option>
	<option value="G336">Genre05</option>
	<option value="G337">Genre06</option>
</select><br>
</div>


<div id="q5_2" style="display:none">
Do you want to see Not valued Books?:
<input type="radio" name="notvaluedbook" value="yes" checked disabled>Yes
<input type="radio" name="notvaluedbook" value="no" disabled>No<br>
</div>


<div id="q6_1" style="display:none">
작가 : <input type="text" name = "Q6-1Write" disabled><br>
</div>

<div id="q7_1" style="display:none">
장르 :
		<select name="Q7-1Genre" disabled>
			<option value="G100" selected>호러.공포소설</option>
			<option value="G101">액션/스릴러소설</option>
			<option value="G102">한국시</option>
			<option value="G103">일본소설</option>
			<option value="G104">로맨스소설</option>
			<option value="G105">영미소설</option>
			<option value="G106">북유럽소설</option>
			<option value="G107">독일소설</option>
			<option value="G108">중국소설</option>
			<option value="G109">프랑스소설</option>
			<option value="G110">스페인소설</option>
			<option value="G111">이탈리아소설</option>
			<option value="G112">도서학</option>
			<option value="G113">문헌정보학</option>
			<option value="G114">백과사전</option>
			<option value="G115">강연집</option>
			<option value="G116">일반연속간행물</option>
			<option value="G117">연구기관</option>
			<option value="G118">신문</option>
			<option value="G119">일반전집</option>
			<option value="G120">향토자료</option>
			<option value="G121">화학</option>
			<option value="G122">농업</option>
			<option value="G123">공학</option>
			<option value="G124">건축</option>
			<option value="G125">기계공학</option>
			<option value="G126">전기공학</option>
			<option value="G127">화학공학</option>
			<option value="G128">제조업</option>
			<option value="G129">생활과학</option>
			<option value="G130">Genre01</option>
			<option value="G131">Genre02</option>
			<option value="G200">추리</option>
			<option value="G201">SF</option>
			<option value="G202">판타지</option>
			<option value="G203">청소년 문학</option>
			<option value="G204">형이상학</option>
			<option value="G205">인식론</option>
			<option value="G206">철학의 체계</option>
			<option value="G207">경학</option>
			<option value="G208">동양철학</option>
			<option value="G209">서양철학</option>
			<option value="G210">논리학</option>
			<option value="G211">심리학</option>
			<option value="G212">윤리학</option>
			<option value="G213">미사용</option>
			<option value="G214">조각</option>
			<option value="G215">공예</option>
			<option value="G216">서예</option>
			<option value="G217">회화</option>
			<option value="G218">사진예술</option>
			<option value="G219">음악</option>
			<option value="G220">공연예술</option>
			<option value="G221">오락</option>
			<option value="G222">비교종교</option>
			<option value="G223">불교</option>
			<option value="G224">기독교</option>
			<option value="G225">도교</option>
			<option value="G226">천도교</option>
			<option value="G227">힌두교</option>
			<option value="G228">이슬람교</option>
			<option value="G229">기타제종교</option>
			<option value="G230">Genre03</option>
			<option value="G231">Genre04</option>
			<option value="G301">한국어</option>
			<option value="G302">중국어</option>
			<option value="G303">일본어</option>
			<option value="G304">영어</option>
			<option value="G305">독일어</option>
			<option value="G306">프랑스어</option>
			<option value="G307">스페인어</option>
			<option value="G308">이탈리아어</option>
			<option value="G309">기타제어</option>
			<option value="G310">통계학</option>
			<option value="G311">경제학</option>
			<option value="G312">사회학</option>
			<option value="G313">정치학</option>
			<option value="G314">행정학</option>
			<option value="G315">법학</option>
			<option value="G316">교육학</option>
			<option value="G317">민속학</option>
			<option value="G318">군사학</option>
			<option value="G319">수학</option>
			<option value="G320">물리학</option>
			<option value="G321">화학</option>
			<option value="G322">천문학</option>
			<option value="G323">지학</option>
			<option value="G324">광물학</option>
			<option value="G325">생명과학</option>
			<option value="G326">식물학</option>
			<option value="G327">동물학</option>
			<option value="G328">아시아</option>
			<option value="G329">유럽</option>
			<option value="G330">아프리카</option>
			<option value="G331">북아메리카</option>
			<option value="G332">남아메리카</option>
			<option value="G333">오세아니아</option>
			<option value="G334">지리</option>
			<option value="G335">전기</option>
			<option value="G336">Genre05</option>
			<option value="G337">Genre06</option>
		</select>
		
		가격 : 
		<input type="text" name="Q7-1Price" disabled/><br>
</div>


<div id="q7_2" style="display:none">
출판일 :
		<input type="date" value="yyyy-mm-dd" min="1998-09-01" name = "Q7-2Date" disabled>
		
		가격 : 
		<input type="text" name = "Q7-2Price" disabled>
</div>


<div id="q8_1" style="display:none">
작가 :
		<input type="text" name="Q8-1Writer" disabled/>
		
		정렬 : 
		<select name="Q8-1Sort" disabled>
			<option value="ASC" selected>오름차순</option>
			<option value="DESC">내림차순</option>
		</select>
</div>


<div id="q8_2" style="display:none">
날짜 정렬 : 
		<select name="Q8-2Sort" disabled>
			<option value="ASC" selected>오름차순</option>
			<option value="DESC">내림차순</option>
		</select>
</div>


<div id="q9_1" style="display:none">
작가 이름  
		<select name="Q9-1Sort" disabled>
			<option value="ASC" selected>오름차순</option>
			<option value="DESC">내림차순</option>
		</select>
</div>


<div id="q9_2" style="display:none">
작가 이름  
		<select name="Q9-2Sort" disabled>
			<option value="ASC" selected>오름차순</option>
			<option value="DESC">내림차순</option>
		</select>
</div>


<div id="q10_1" style="display:none">
장르 : 
		<select name="Q10-1Genre" disabled>
			<option value="G100" selected>호러.공포소설</option>
			<option value="G101">액션/스릴러소설</option>
			<option value="G102">한국시</option>
			<option value="G103">일본소설</option>
			<option value="G104">로맨스소설</option>
			<option value="G105">영미소설</option>
			<option value="G106">북유럽소설</option>
			<option value="G107">독일소설</option>
			<option value="G108">중국소설</option>
			<option value="G109">프랑스소설</option>
			<option value="G110">스페인소설</option>
			<option value="G111">이탈리아소설</option>
			<option value="G112">도서학</option>
			<option value="G113">문헌정보학</option>
			<option value="G114">백과사전</option>
			<option value="G115">강연집</option>
			<option value="G116">일반연속간행물</option>
			<option value="G117">연구기관</option>
			<option value="G118">신문</option>
			<option value="G119">일반전집</option>
			<option value="G120">향토자료</option>
			<option value="G121">화학</option>
			<option value="G122">농업</option>
			<option value="G123">공학</option>
			<option value="G124">건축</option>
			<option value="G125">기계공학</option>
			<option value="G126">전기공학</option>
			<option value="G127">화학공학</option>
			<option value="G128">제조업</option>
			<option value="G129">생활과학</option>
			<option value="G130">Genre01</option>
			<option value="G131">Genre02</option>
			<option value="G200">추리</option>
			<option value="G201">SF</option>
			<option value="G202">판타지</option>
			<option value="G203">청소년 문학</option>
			<option value="G204">형이상학</option>
			<option value="G205">인식론</option>
			<option value="G206">철학의 체계</option>
			<option value="G207">경학</option>
			<option value="G208">동양철학</option>
			<option value="G209">서양철학</option>
			<option value="G210">논리학</option>
			<option value="G211">심리학</option>
			<option value="G212">윤리학</option>
			<option value="G213">미사용</option>
			<option value="G214">조각</option>
			<option value="G215">공예</option>
			<option value="G216">서예</option>
			<option value="G217">회화</option>
			<option value="G218">사진예술</option>
			<option value="G219">음악</option>
			<option value="G220">공연예술</option>
			<option value="G221">오락</option>
			<option value="G222">비교종교</option>
			<option value="G223">불교</option>
			<option value="G224">기독교</option>
			<option value="G225">도교</option>
			<option value="G226">천도교</option>
			<option value="G227">힌두교</option>
			<option value="G228">이슬람교</option>
			<option value="G229">기타제종교</option>
			<option value="G230">Genre03</option>
			<option value="G231">Genre04</option>
			<option value="G301">한국어</option>
			<option value="G302">중국어</option>
			<option value="G303">일본어</option>
			<option value="G304">영어</option>
			<option value="G305">독일어</option>
			<option value="G306">프랑스어</option>
			<option value="G307">스페인어</option>
			<option value="G308">이탈리아어</option>
			<option value="G309">기타제어</option>
			<option value="G310">통계학</option>
			<option value="G311">경제학</option>
			<option value="G312">사회학</option>
			<option value="G313">정치학</option>
			<option value="G314">행정학</option>
			<option value="G315">법학</option>
			<option value="G316">교육학</option>
			<option value="G317">민속학</option>
			<option value="G318">군사학</option>
			<option value="G319">수학</option>
			<option value="G320">물리학</option>
			<option value="G321">화학</option>
			<option value="G322">천문학</option>
			<option value="G323">지학</option>
			<option value="G324">광물학</option>
			<option value="G325">생명과학</option>
			<option value="G326">식물학</option>
			<option value="G327">동물학</option>
			<option value="G328">아시아</option>
			<option value="G329">유럽</option>
			<option value="G330">아프리카</option>
			<option value="G331">북아메리카</option>
			<option value="G332">남아메리카</option>
			<option value="G333">오세아니아</option>
			<option value="G334">지리</option>
			<option value="G335">전기</option>
			<option value="G336">Genre05</option>
			<option value="G337">Genre06</option>
		</select>
</div>

<div id="q10_2" style="display:none">
출판사 : 
		<select name="Q10-2PUBLISHER" disabled>
			<option value="P100" selected>이둔</option>
			<option value="P101">푸른물고기</option>
			<option value="P102">마을</option>
			<option value="P103">대현문화사</option>
			<option value="P104">한숲출판사</option>
			<option value="P105">깊은강</option>
			<option value="P106">도서출판 동문사</option>
			<option value="P107">시공사</option>
			<option value="P108">씨엔씨미디어</option>
			<option value="P109">예담</option>
			<option value="P110">프로넷</option>
			<option value="P112">고즈넉이엔티</option>
			<option value="P113">다향</option>
			<option value="P114">봄미디어</option>
			<option value="P115">살림</option>
			<option value="P116">아르테</option>
			<option value="P117">오후세시</option>
			<option value="P118">뿔(웅진)</option>
			<option value="P119">북로드</option>
			<option value="P120">열린책들</option>
			<option value="P200">해문출판사</option>
			<option value="P201">재인</option>
			<option value="P203">문학동네</option>
			<option value="P205">창비</option>
			<option value="P206">대원씨아이</option>
			<option value="P207">태일소담</option>
			<option value="P208">민음사</option>
			<option value="P209">현대문학</option>
			<option value="P210">알에이치코리아</option>
			<option value="P211">도서출판작가정신</option>
			<option value="P212">도서출판책세상</option>
			<option value="P213">루비박스</option>
			<option value="P214">에이콘출판</option>
			<option value="P215">북플라자</option>
			<option value="P216">비룡소</option>
			<option value="P217">영상출판미디어</option>
			<option value="P220">김영사</option>
			<option value="P221">도서출판아침이슬</option>
			<option value="P300">팩토리나인</option>
			<option value="P301">엘릭시르</option>
			<option value="P302">제우미디어</option>
			<option value="P303">문학수첩</option>
			<option value="P304">한스미디어</option>
			<option value="P305">북폴리오</option>
			<option value="P306">황금가지</option>
			<option value="P307">노블마인</option>
			<option value="P308">다산책방</option>
			<option value="P309">북하우스</option>
			<option value="P310">Publishment01</option>
			<option value="P311">Publishment02</option>
			<option value="P312">Publishment03</option>
			<option value="P313">Publishment04</option>
			<option value="P314">Publishment05</option>
			<option value="P315">Publishment06</option>
			<option value="P316">Publishment07</option>
			<option value="P317">Publishment08</option>
			<option value="P318">Publishment09</option>
			<option value="P319">Publishment10</option>
			<option value="P320">Publishment11</option>
			<option value="P321">Publishment12</option>
			<option value="P322">Publishment13</option>
			<option value="P323">Publishment14</option>
			<option value="P324">Publishment15</option>
			<option value="P325">Publishment16</option>
			<option value="P326">Publishment17</option>
			<option value="P327">Publishment18</option>
			<option value="P328">Publishment19</option>
			<option value="P329">Publishment20</option>
			<option value="P330">Publishment21</option>
			<option value="P331">Publishment22</option>
			<option value="P332">Publishment23</option>
			<option value="P333">Publishment24</option>
			<option value="P334">Publishment25</option>
			<option value="P335">Publishment26</option>
			<option value="P336">Publishment27</option>
			<option value="P337">Publishment28</option>
			<option value="P338">Publishment29</option>
			<option value="P339">Publishment30</option>
			<option value="P340">Publishment31</option>
			<option value="P341">Publishment32</option>
			<option value="P342">Publishment33</option>
			<option value="P343">Publishment34</option>
			<option value="P344">Publishment35</option>
			<option value="P345">Publishment36</option>
			<option value="P346">Publishment37</option>
			<option value="P347">Publishment38</option>
			<option value="P348">Publishment39</option>
			<option value="P349">Publishment40</option>
			<option value="P350">Publishment41</option>
			<option value="P351">Publishment42</option>
			<option value="P352">Publishment43</option>
			<option value="P353">Publishment44</option>
			<option value="P354">Publishment45</option>
			<option value="P355">Publishment46</option>
			<option value="P356">Publishment47</option>
			<option value="P357">Publishment48</option>
			<option value="P358">Publishment49</option>
			<option value="P359">Publishment50</option>
			<option value="P360">Publishment51</option>
			<option value="P361">Publishment52</option>
		</select>
		
		
		장르 : 
		<select name="Q10-2Genre" disabled>
			<option value="G100" selected>호러.공포소설</option>
			<option value="G101">액션/스릴러소설</option>
			<option value="G102">한국시</option>
			<option value="G103">일본소설</option>
			<option value="G104">로맨스소설</option>
			<option value="G105">영미소설</option>
			<option value="G106">북유럽소설</option>
			<option value="G107">독일소설</option>
			<option value="G108">중국소설</option>
			<option value="G109">프랑스소설</option>
			<option value="G110">스페인소설</option>
			<option value="G111">이탈리아소설</option>
			<option value="G112">도서학</option>
			<option value="G113">문헌정보학</option>
			<option value="G114">백과사전</option>
			<option value="G115">강연집</option>
			<option value="G116">일반연속간행물</option>
			<option value="G117">연구기관</option>
			<option value="G118">신문</option>
			<option value="G119">일반전집</option>
			<option value="G120">향토자료</option>
			<option value="G121">화학</option>
			<option value="G122">농업</option>
			<option value="G123">공학</option>
			<option value="G124">건축</option>
			<option value="G125">기계공학</option>
			<option value="G126">전기공학</option>
			<option value="G127">화학공학</option>
			<option value="G128">제조업</option>
			<option value="G129">생활과학</option>
			<option value="G130">Genre01</option>
			<option value="G131">Genre02</option>
			<option value="G200">추리</option>
			<option value="G201">SF</option>
			<option value="G202">판타지</option>
			<option value="G203">청소년 문학</option>
			<option value="G204">형이상학</option>
			<option value="G205">인식론</option>
			<option value="G206">철학의 체계</option>
			<option value="G207">경학</option>
			<option value="G208">동양철학</option>
			<option value="G209">서양철학</option>
			<option value="G210">논리학</option>
			<option value="G211">심리학</option>
			<option value="G212">윤리학</option>
			<option value="G213">미사용</option>
			<option value="G214">조각</option>
			<option value="G215">공예</option>
			<option value="G216">서예</option>
			<option value="G217">회화</option>
			<option value="G218">사진예술</option>
			<option value="G219">음악</option>
			<option value="G220">공연예술</option>
			<option value="G221">오락</option>
			<option value="G222">비교종교</option>
			<option value="G223">불교</option>
			<option value="G224">기독교</option>
			<option value="G225">도교</option>
			<option value="G226">천도교</option>
			<option value="G227">힌두교</option>
			<option value="G228">이슬람교</option>
			<option value="G229">기타제종교</option>
			<option value="G230">Genre03</option>
			<option value="G231">Genre04</option>
			<option value="G301">한국어</option>
			<option value="G302">중국어</option>
			<option value="G303">일본어</option>
			<option value="G304">영어</option>
			<option value="G305">독일어</option>
			<option value="G306">프랑스어</option>
			<option value="G307">스페인어</option>
			<option value="G308">이탈리아어</option>
			<option value="G309">기타제어</option>
			<option value="G310">통계학</option>
			<option value="G311">경제학</option>
			<option value="G312">사회학</option>
			<option value="G313">정치학</option>
			<option value="G314">행정학</option>
			<option value="G315">법학</option>
			<option value="G316">교육학</option>
			<option value="G317">민속학</option>
			<option value="G318">군사학</option>
			<option value="G319">수학</option>
			<option value="G320">물리학</option>
			<option value="G321">화학</option>
			<option value="G322">천문학</option>
			<option value="G323">지학</option>
			<option value="G324">광물학</option>
			<option value="G325">생명과학</option>
			<option value="G326">식물학</option>
			<option value="G327">동물학</option>
			<option value="G328">아시아</option>
			<option value="G329">유럽</option>
			<option value="G330">아프리카</option>
			<option value="G331">북아메리카</option>
			<option value="G332">남아메리카</option>
			<option value="G333">오세아니아</option>
			<option value="G334">지리</option>
			<option value="G335">전기</option>
			<option value="G336">Genre05</option>
			<option value="G337">Genre06</option>
		</select>
</div>


<div id="research" style="display:none">
무엇을 검색하고 싶나요?
<input type="radio" name="search" value="booktitle" checked disabled>책
<input type="radio" name="search" value="bookgenre" disabled>장르
<input type="radio" name="search" value="writer" disabled>작가
<input type="radio" name="search" value="publisher" disabled>출판사<br>
<input type="text" name="what" disabled>
</div>


<div id="rating" style="display:none">
책 평가하기<br>
책 제목: <input type="text" name="ratetitle" disabled>
점 수 : <input type="text" name="ratescore" disabled>
</div>


<input type="reset" value="reset">  <input type="submit" value="submit"> 
</form>

<button type="button" onclick="location.href='login.jsp'">로그아웃</button>


</body>
</html>