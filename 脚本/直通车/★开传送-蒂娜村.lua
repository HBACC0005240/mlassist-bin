★起点艾尔莎岛登入点，蒂娜村传送开启脚本。


::begin::
	当前地图名 = 取当前地图名()
	if (当前地图名=="艾尔莎岛" )then	
		goto aiersa  
	elseif (当前地图名=="里谢里雅堡" )then	
		goto libao  	
	elseif(当前地图名=="杰诺瓦镇的传送点") then
		goto jlwc	
	elseif (当前地图名=="启程之间" )then	
		goto warproom  	
	end	
	回城()
	等待(1000)
	goto begin		
::aiersa::
	if(取当前地图名()~="艾尔莎岛")then	goto begin end
	移动(140,105)
	转向(1)
	等待服务器返回()	
	对话选择(4, 0)	
::libao::
	if(取当前地图名()~="里谢里雅堡")then	goto begin end
	移动(34,89)
	回复(1)	
	移动(41,50,"里谢里雅堡 1楼")	
	移动(45,20,"启程之间")	
::warproom::
	移动(15, 4)	
	离开队伍()
	转向(2)
	dlg=等待服务器返回()
	if(dlg.message~=nil and (string.find(dlg.message,"此传送点的资格")~=nil or string.find(dlg.message,"很抱歉")~=nil or string.find(dlg.message,"不能使用这个传送石")~=nil))then		
		执行脚本("./脚本/直通车/★开传送-杰诺瓦镇.lua")
		goto jlwc
	end		
	转向(2)
	等待服务器返回()
	对话选择(4,0)
::jlwc::
	等待到指定地图("杰诺瓦镇的传送点")
	移动(6, 7)	
	转向(2)
	等待(1000)	
   	移动(14, 6,"村长的家")
	移动(1, 9,"杰诺瓦镇")
	移动(44, 33,"医院")	
    移动(10, 5)
	回复(2)		
	等待(1000)    
    移动(1, 9,"杰诺瓦镇")	
	移动(71, 18,"莎莲娜")	
	移动(570,275,"蒂娜村")	
	if(取当前地图编号() ~= 4200)then
		日志("当前时间是:"..游戏时间(),1)		
		移动(29,21,"莎莲娜")
		while true do 
			if(游戏时间() ~= "黎明" and 游戏时间() ~= "白天")then		
				日志("当前时间是【"..游戏时间().."】，等待黎明或白天")
				等待(30000)			
			else
				等待(30000)		
				移动(570,275,"蒂娜村")			
				break
			end		
		end	
	end	
	移动(29, 60,4212)	
	移动(9, 7,4213)	
	移动(7, 12,4214)	
	移动(12, 6,4299)	
	移动(4, 8)		--这个坐标应该不对
	转向(4)
	等待(1000)        
