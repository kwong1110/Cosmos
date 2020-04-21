<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap-div1{width:100%; height:900px; margin:0 auto; text-align:center; vertical-align:middle; background: rgb(254,245,198);}
    .div-left1{width:45%; height:inherit; float:left;}
    	.left-top1{width:100%; height:60%; border:1px solid #000; box-sizing: border-box; border-bottom:0; border-right:0;}
    		.left-top1-table1{display:table; float:left; margin-left:70px; margin-top:20px; }
    			.left-top1-table-row{display:table-row; border: 1px solid black;}
    			.left-top1-table-cell{display:table-cell; border: 1px solid black; width:100px; height:60px; 
    								  vertical-align:middle; background:#135D36; color:white; cursor:pointer;}
    		.left-top1-table2{display:table; float:right; margin-right:70px; margin-top:20px;}
    			.left-top1-table-row{display:table-row; border: 1px solid black;}
    			.left-top1-table-cell{display:table-cell; border: 1px solid black; width:100px; height:60px; vertical-align:middle; border-radius:10px;}	
   	 	.left-bottom1{width:100%; height:40%; border:1px solid #000; box-sizing: border-box;border-top:0; border-right:0;}
   	 		.left-bottom1-toilet{display:table; float:left; margin-top:105px;}
   	 			.toilet{display:table-row; border: 1px solid black;}
   	 			.man{display:table-cell; border: 1px solid black; width:125px; height:125px; 
   	 				 vertical-align:middle;border-left:0; border-bottom:0; border-radius: 0px 10px 10px 10px; background:blue;color:white;}
   	 			.woman{display:table-cell; border: 1px solid black; width:125px; height:125px; 
   	 				   vertical-align:middle;border-left:0; border-bottom:0;border-radius: 0px 10px 10px 10px; background:salmon;color:white;}
   	 		.left-bottom1-counter{display:table; float:right; margin-top:28px; margin-right:70px;}
   	 			.counter{display:table-row; border: 1px solid black;}	
   	 			.oneCounter{display:table-cell; border: 1px solid black; width:100px; height:300px; 
   	 						vertical-align:middle; border-radius: 10px 10px 10px 10px; background:brown; color:white;}
    .div-right1{width:55%; height:inherit; float:right;}
    	.right-top1{width:100%; height:57%; border:1px solid #000; box-sizing: border-box; border-bottom:0; border-left:0;}
    		.right-top1-bigclass{display:table; float:right;margin-left:70px;margin-right:60px;  }
    			.bigger{display:table-row; border: 1px solid black;  }
    			.big{display:table-cell; border: 1px solid black; width:760px;height:200px; cursor:pointer;
    				 vertical-align:middle; border-top:0; border-right:0; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}
    		.right-top1-sixclass1{display:table; float:left; margin-left:74px; margin-top:65px;}
    			.sixpeople{display:table-row; border: 1px solid black;}
    			.six1{display:table-cell; border: 1px solid black; width:300px; height:230px; cursor:pointer;
    				  vertical-align:middle; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}
    		.right-top1-sixclass2{display:table; float:right; margin-top:65px; margin-right:60px;}
    			.sixpeople{display:table-row; border: 1px solid black;}
    			.six2{display:table-cell; border: 1px solid black; width:300px; height:230px; cursor:pointer;
    				  vertical-align:middle; border-right:0; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}	
    	.right-bottom1{width:100%; height:43%; border:1px solid #000; box-sizing: border-box; border-top:0; border-left:0;}
    		.right-bot-fourclass1{display:table; float:left; margin-left:74px; margin-top:25px;}	
    			.fourperson1{display:table-row; border: 1px solid black;}
    			.four1{display:table-cell; border: 1px solid black; width:300px; height: 150px; cursor:pointer;
    				   vertical-align:middle; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}
    		.right-bot-fourclass2{display:table; float:right; margin-top:25px; margin-right:60px;}	
    			.fourperson1{display:table-row; border: 1px solid black;}
    			.four2{display:table-cell; border: 1px solid black; width:300px; height: 150px; cursor:pointer;
    				   vertical-align:middle; border-right:0; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}
    		.right-bot-fourclass3{display:table; float:left; margin-left:74px; margin-top:30px;}	
    			.fourperson2{display:table-row; border: 1px solid black;}
    			.four3{display:table-cell; border: 1px solid black; width:300px; height: 150px; cursor:pointer;
    			 	   vertical-align:middle; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}
    		.right-bot-fourclass4{display:table; float:right; margin-top:30px; margin-right:60px;}	
    			.fourperson2{display:table-row; border: 1px solid black;}
    			.four4{display:table-cell; border: 1px solid black; width:300px; height: 150px; cursor:pointer;
    				   vertical-align:middle; border-right:0; border-radius: 10px 10px 10px 10px; background:#135D36; color:white;}		
</style>
</head>
<body>
	<div class="wrap-div1">
        <div class="div-left1">
        	<div class="left-top1">
        		<div class="left-top1-table1">
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-1">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-2">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-3">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-4">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-5">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-6">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-7">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-8">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-9">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-10">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-11">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-12">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-13">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-14">
        				1인석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-15">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-16">
        				1인석
        				</div>
        			</div>
        		</div>
        		<div class="left-top1-table2">
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-17">
        				1인석
        				</div>
        				<div class="left-top1-table-cell" style="background:#2E4559"><input type="hidden" value="Z-18">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-19">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-20">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-21">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-22">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-23">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-24">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-25">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-26">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-27">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-28">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-29">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-30">
        				고정석
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-31">
        				1인석
        				</div>
        				<div class="left-top1-table-cell"style="background:#2E4559"><input type="hidden" value="Z-32">
        				고정석
        				</div>
        			</div>
        		</div>
        	</div>
        	<div class="left-bottom1">
        		<div class="left-bottom1-toilet">
        			<div class="toilet">
        				<div class="woman">
        				여자화장실
        				</div>
        			</div>
        			<div class="toilet">
        				<div class="man">
        				남자화장실
        				</div>
        			</div>
        		</div>
        		<div class="left-bottom1-counter">
        			<div class="counter">
        				<div class="oneCounter">
        					카운터
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <div class="div-right1">
            <div class="right-top1">
            	<div class="right-top1-bigclass">
            		<div class="bigger">
            			<div class="big"><input type="hidden" value="E-1">
            				대규모 강연동(30인석)
            			</div>
            		</div>	
            	</div>
            	<div class="right-top1-sixclass1">
            		<div class="sixpeople">
            			<div class="six1"><input type="hidden" value="D-1">
            				8인실
            			</div>
            		</div>
            	</div>
            	<div class="right-top1-sixclass2">
            		<div class="sixpeople">
            			<div class="six2"><input type="hidden" value="D-2">
            				8인실
            			</div>
            		</div>
            	</div>
            </div>
            <div class="right-bottom1">
            	<div class="right-bot-fourclass1">
            		<div class="fourperson1">
            			<div class="four1"><input type="hidden" value="C-1">
            				6인실
            			</div>
            		</div>
            	</div>
            	<div class="right-bot-fourclass2">
            		<div class="fourperson1">
            			<div class="four2"><input type="hidden" value="C-2">
            				6인실
            			</div>
            		</div>
            	</div>
            	<div class="right-bot-fourclass3">
            		<div class="fourperson2">
            			<div class="four3"><input type="hidden" value="B-3">
            				4인실
            			</div>
            		</div>
            	</div>
            	<div class="right-bot-fourclass4">
            		<div class="fourperson2">
            			<div class="four4"><input type="hidden" value="B-4">
            				4인실
            			</div>
            		</div>
            	</div>
            </div>
        </div>
    </div>
</body>
</html>