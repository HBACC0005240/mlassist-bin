--定居艾尔莎岛


::begin::
	if(取当前地图名() == "医院")then
		goto 医院
	end 
	回城()
	等待(1000)	
	等待到指定地图("艾尔莎岛")
	对话选是(1)	
	等待到指定地图("里谢里雅堡")
	自动寻路(65,53,"法兰城")
	自动寻路(221,83,"医院")
::医院::
	等待到指定地图("医院")	
	自动寻路(15,8)	

	转向(2)
	等待服务器返回()
	对话选择(0,2)
	等待服务器返回()
	对话选择(0,0)	
	等待(2000)


