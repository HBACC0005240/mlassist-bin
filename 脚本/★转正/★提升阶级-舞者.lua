--定居艾尔莎岛


::begin::
	回城()
	等待(1000)
	执行脚本("./脚本/直通车/★公交车-法兰To阿凯鲁法.lua")
	等待到指定地图("阿凯鲁法村")	
	移动(183,104,"阿凯鲁法城")		--33100
	移动(25,11,"33101")
	移动(15,27)
	对话选是(0)
	等待到指定地图("贵宾室")
	
	移动(11,11)
	转向(0)
	等待服务器返回()
	对话选择(0,2)
	等待服务器返回()
	对话选择(0,0)	
	等待(2000)


