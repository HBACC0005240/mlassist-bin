--定居艾尔莎岛

common=require("common")

common.supplyCastle()
common.sellCastle()		--默认卖
common.checkHealth(医生名称)


设置("遇敌全跑",1)

::begin::
	if(取当前地图名() == "又小又暗的洞窟")then
		goto upgrade
	end 
	common.toTeleRoom("维诺亚村")	
	等待(1000)
	等待到指定地图("维诺亚村的传送点")
	自动寻路(5, 1)
	等待到指定地图("村长家的小房间")	
	自动寻路(0, 5)
	等待到指定地图("村长的家")	
	自动寻路(10, 16)
	等待到指定地图("维诺亚村")	
	自动寻路(67, 47)
	等待到指定地图("芙蕾雅")	
	自动寻路(328, 451,"又小又暗的洞窟")
	自动寻路(14, 10,"又小又暗的洞窟")
::upgrade::	
	转向坐标(13,9)
	喊话("竹林山水甲天下",2,3,1)
	等待服务器返回()
	对话选择(1,0)	
	等待到指定地图("竹的住处")
	自动寻路(16, 8)
	转向坐标(16,7)
	等待服务器返回()
	对话选择(0,2)
	等待服务器返回()
	对话选择(0,0)	
	等待(2000)
	设置("遇敌全跑",0)



