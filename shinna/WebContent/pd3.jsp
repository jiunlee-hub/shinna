<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>SHINNA</title>
<link href = "images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<style>
body{
	background: white;
}
#center{
	text-align:center;
	margin:0px auto;
}

#reservation > ul {
	list-style-type: none;
	}
	
.rom {
	margin:10px;
}

.ga {
	height:400px;
}


@media all and (min-width:768px){
	#reservation > ul { float: left;
		margin-left:10px;
	}
	#reservation {
		width:750px;
	}

}

@media all and (min-width:425px){
.member {
	text-algin:left;

	}	
}

</style>
</head>
<body oncontextmenu="return false" ondragstart="return false">

<!-- 소개 영역 -->
<section class="container mt-5"> 
		<div class="text-center">
			<h1 class="h3 font-weight-bold">Romantic Year-End</h1>
<div class="card mb-3">
<img src="./images/bye.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h2 class="card-title font-weight-bold h4">프로모션 상세정보</h2><br>
    <p class="card-text text-left h6">내용 │ 신나호텔에서 완벽해지는 하루!</p>
    <p class="card-text text-left h6">금액 │ KRW 390,350~</p>
    <p class="card-text text-left h6">환불 │ 숙박예정일 3일 전까지는 위약금 없이 취소 가능</p>
    <br>
    <p class="card-text text-left"><small class="text-muted">◦온라인 예약 시에만 혜택이 적용됩니다.</small></p>
    <p class="card-text text-left"><small class="text-muted">◦15% 부가가치세 별도입니다.</small></p>
    <p class="card-text text-left"><small class="text-muted">◦(더블욕조or샤워부스)체크인 시 객실 상황에 따라 배정됩니다.</small></p>
  </div>
</div>
</div>
</section>

<script src="js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
</body>
</html>