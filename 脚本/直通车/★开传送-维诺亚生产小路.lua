★起点艾尔莎岛登入点，维村传送开启脚本。


function main()
	日志("维诺亚生产开传",1)
::begin::
	当前地图名 = 取当前地图名()
	if (当前地图名=="艾尔莎岛" )then	
		goto aiersa  
	elseif (当前地图名=="里谢里雅堡" )then	
		goto libao  	
	end	
	回城()
	等待(1000)
	goto begin	

::aiersa::
	等待到指定地图("艾尔莎岛")		
	移动(140,105)
	转向(1)
	等待服务器返回()	
	对话选择(4, 0)	
::libao::
	等待到指定地图("里谢里雅堡")	
	移动(34,89)
	回复(1)	
::quwnyc::
	移动(41, 98)	
	等待到指定地图("法兰城")
	移动(153, 241)	
	等待到指定地图("芙蕾雅")	
	移动(474, 316)	
	移动(473, 316)	
	对话选是(472,316)	
	等待到指定地图("维诺亚洞穴 地下1楼")	
    移动(15, 16)	
	对话选是(14,16)	
	等待到指定地图("维诺亚洞穴 地下1楼",10,12)	
	移动(8, 10,"小路")	
	移动(55, 53,"维诺亚洞穴 地下3楼")	
    移动(26, 64,"芙蕾雅")	
	移动(330, 480,"维诺亚村")		
	移动(40, 36,"村长的家")
	移动(18, 10,"村长家的小房间")
	移动(8, 2,"维诺亚村的传送点")	
	移动(5, 5)	
	转向(0)
	等待(1000)	

end
main()