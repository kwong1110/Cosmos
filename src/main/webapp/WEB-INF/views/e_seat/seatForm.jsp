<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap-div1{width:100%; height:900px; margin:0 auto; text-align:center; vertical-align:middle;  /* background: #E8F2C2; */ }
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
   	 				 vertical-align:middle;border-left:0; border-bottom:0; border-radius: 0px 10px 10px 10px; background:#2E4559;color:white;}
   	 			.woman{display:table-cell; border: 1px solid black; width:125px; height:125px; 
   	 				   vertical-align:middle;border-left:0; border-bottom:0;border-radius: 0px 10px 10px 10px; background:#2E4559;color:white;}
   	 		.left-bottom1-counter{display:table; float:right; margin-top:28px; margin-right:70px;}
   	 			.counter{display:table-row; border: 1px solid black;}	
   	 			.oneCounter{display:table-cell; border: 1px solid black; width:100px; height:300px; 
   	 						vertical-align:middle; border-radius: 10px 10px 10px 10px; background:#2E4559; color:white;}
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
        				<div class="left-top1-table-cell"><input type="hidden" value="A-1" id="A-1" class="chair">A - 1
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-2" id="A-2" class="chair">A - 2
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-3" id="A-3" class="chair">A - 3
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-4" id="A-4" class="chair">A - 4
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-5" id="A-5" class="chair">A - 5
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-6" id="A-6" class="chair">A - 6
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-7" id="A-7" class="chair">A - 7
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-8" id="A-8" class="chair">A - 8
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-9" id="A-9" class="chair">A - 9
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-10" id="A-10" class="chair">A - 10
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-11" id="A-11" class="chair">A - 11
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-12" id="A-12" class="chair">A - 12
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-13" id="A-13" class="chair">A - 13
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-14" id="A-14" class="chair">A - 14
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-15" id="A-15" class="chair">A - 15
        				</div>
        				<div class="left-top1-table-cell"><input type="hidden" value="A-16" id="A-16" class="chair">A - 16
        				</div>
        			</div>
        		</div>
        		<div class="left-top1-table2">
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-17" id="A-17" class="chair">A - 17
        				</div>
        				<div class="left-top1-table-cell" style="background:#0F3BBF"><input type="hidden" value="Z-18" id="Z-18" class="chair zSeat" name="z">Z - 18
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-19" id="A-19" class="chair">A - 19
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-20" id="Z-20" class="chair zSeat" name="z">Z - 20
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-21" id="A-21" class="chair">A - 21
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-22" id="Z-22" class="chair zSeat" name="z">Z - 22
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-23" id="A-23" class="chair">A - 23
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-24" id="Z-24" class="chair zSeat" name="z">Z - 24
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-25" id="A-25" class="chair">A - 25
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-26" id="Z-26" class="chair zSeat" name="z">Z - 26
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-27" id="A-27" class="chair">A - 27
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-28" id="Z-28" class="chair zSeat" name="z">Z - 28
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-29" id="A-29" class="chair">A - 29
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-30" id="Z-30" class="chair zSeat" name="z">Z - 30
        				</div>
        			</div>
        			<div class="left-top1-table-row">
        				<div class="left-top1-table-cell"><input type="hidden" value="A-31" id="A-31" class="chair">A - 31
        				</div>
        				<div class="left-top1-table-cell"style="background:#0F3BBF"><input type="hidden" value="Z-32" id="Z-32" class="chair zSeat" name="z">Z - 32
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
            			<div class="big"><input type="hidden" value="E-1" id="E-1" class="chair">대규모 강연동(30인석) (E - 1)
            			</div>
            		</div>	
            	</div>
            	<div class="right-top1-sixclass1">
            		<div class="sixpeople">
            			<div class="six1"><input type="hidden" value="D-1" id="D-1" class="chair">8인실 (D - 1)
            			</div>
            		</div>
            	</div>
            	<div class="right-top1-sixclass2">
            		<div class="sixpeople">
            			<div class="six2"><input type="hidden" value="D-2" id="D-2" class="chair">8인실 (D - 2)
            			</div>
            		</div>
            	</div>
            </div>
            <div class="right-bottom1">
            	<div class="right-bot-fourclass1">
            		<div class="fourperson1">
            			<div class="four1"><input type="hidden" value="C-1" id="C-1" class="chair">6인실 (C - 1)
            			</div>
            		</div>
            	</div>
            	<div class="right-bot-fourclass2">
            		<div class="fourperson1">
            			<div class="four2"><input type="hidden" value="C-2" id="C-2" class="chair">6인실 (C - 2)
            			</div>
            		</div>
            	</div>
            	<div class="right-bot-fourclass3">
            		<div class="fourperson2">
            			<div class="four3"><input type="hidden" value="B-1" id="B-1" class="chair">4인실 (B - 1)
            			</div>
            		</div>
            	</div>
            	<div class="right-bot-fourclass4">
            		<div class="fourperson2">
            			<div class="four4"><input type="hidden" value="B-2" id="B-2" class="chair">4인실 (B - 2)
            			</div>
            		</div>
            	</div>
            </div>
        </div>
    </div>
</body>
</html>