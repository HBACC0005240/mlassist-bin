--定居艾尔莎岛


::begin::
	common.toTeleRoom("圣拉鲁卡村")
	自动寻路(7, 3,"村长的家")
	自动寻路(6, 14,"村长的家 2楼")		
	自动寻路(8,5)
	转向(0)
	等待服务器返回()
	对话选择(0,2)
	等待服务器返回()
	对话选择(0,0)	
	等待(2000)


