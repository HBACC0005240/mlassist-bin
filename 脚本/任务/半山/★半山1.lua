★半山1脚本，起点艾尔莎岛登入点，根据提示执行脚本

common=require("common")

队长名称=取脚本界面数据("队长名称")
if(队长名称==nil or 队长名称=="")then
	队长名称=用户输入框("请输入队伍名称！","风依旧￠花依然")--风依旧￠花依然  乱￠逍遥
end

isTeamLeader=false		--是否队长
if(人物("名称") == 队长名称)then
	isTeamLeader=true
end

::begin::	
	等待空闲()
	local 当前地图名 = 取当前地图名()
	if (当前地图名=="艾尔莎岛" )then			
		移动(140,105)				
		转向(1)
		等待服务器返回()
		对话选择(4,0)
		等待到指定地图("里谢里雅堡")
		goto liBao
	elseif (当前地图名=="里谢里雅堡" )then	
		goto liBao	
	elseif (当前地图名=="召唤之间" )then	--登出 bank
		移动( 3, 7)	
		等待到指定地图("里谢里雅堡")	
		goto liBao
	elseif (当前地图名=="莎莲娜" )then	
		goto ShaLianLa
	elseif (当前地图名=="蒂娜村" and 取当前地图编号() == 57175)then	
		goto CheckBattleReslut
	elseif (当前地图名=="蒂娜村" )then	
		goto diNaCunLi
	elseif (当前地图名=="启程之间" )then	
		goto quJieCun
	end	
	回城()
	goto begin
        
::liBao::      
	移动(34,89)
	回复(1)			-- 转向北边恢复人宠血魔		
	移动(41,50)
::liBaoYiLow::
	等待到指定地图("里谢里雅堡 1楼")	
	if(取物品数量("491668") > 0 ) then		
		移动(80, 17)
		对话选是(81, 18)
		if(取物品数量("海德的戒指") > 0 ) then	
			人物信息()	--查下称号 有 追查真相中 就完事了
			return
		end
	end
	if(取物品数量("海德的好运符") < 1 ) then		
		移动(80, 17)
		对话选是(81, 18)
	end
	if(取物品数量("海德的好运符") < 1 ) then	
		goto begin
	end
   	移动(45,20,"启程之间")	
	if(游戏时间() == "夜晚" or 游戏时间() == "黄昏")then
		日志("当前时间是【"..游戏时间().."，去杰村！")						
		goto quJieCun
	end		
	goto diNaCun
::quJieCun::
	移动(15, 4)	
	离开队伍()
	转向(2)
	dlg=等待服务器返回()
	--日志(dlg.message,1)
	if(dlg.message~=nil and (string.find(dlg.message,"此传送点的资格")~=nil or string.find(dlg.message,"很抱歉")~=nil ))then
		回城()
		执行脚本("./脚本/直通车/★开传送-杰诺瓦镇.lua")
		goto jiecun
	end	
	转向(2, "")
	等待服务器返回()
	对话选择("4", 0)
	goto jiecun
::diNaCun::	
	移动(25, 4)
	离开队伍()
	对话选是(26,4)
	等待(2000)
	等待空闲()
	if(取当前地图名() ~= "蒂娜村的传送点")then
		日志("未开蒂娜传送。去杰村！")
		goto quJieCun 
	end 
	goto dina
::dina::
	移动(11, 6)
	移动(11, 2)
	等待到指定地图("村长的家")	
	移动(10, 6)
	移动(7, 3)
	移动(7, 1)
	等待到指定地图("村长的家")
	移动(7, 11)
	移动(3, 7)
	移动(1, 7)
	等待到指定地图("村长的家")
	移动(8, 6)
	移动(1, 6)
::diNaCunLi::
	等待到指定地图("蒂娜村")
	if(游戏时间() ~= "夜晚" and 游戏时间() ~= "黄昏")then		
		移动(44, 60)
		移动(44, 62,"莎莲娜")
		while true do 
			if(游戏时间() ~= "夜晚" and 游戏时间() ~= "黄昏")then		
				日志("当前时间是【"..游戏时间().."】，等待黄昏或夜晚")
				等待(30000)			
			else
				等待(30000)		
				移动(585,316,"蒂娜村")					
				break
			end		
		end	
	end	
	移动(63, 52)
	goto dinahanhua
::jiecun::	
	等待到指定地图("杰诺瓦镇的传送点")	
	移动(14, 8)
	移动(14, 6)
	等待到指定地图("村长的家")
	移动(13, 9)
	移动(1, 9)
	等待到指定地图("杰诺瓦镇")
	移动(54, 43)
	移动(54, 35)
	移动(71, 18)
	设置("遇敌全跑",1)
	等待到指定地图("莎莲娜")	
	移动(570,275,"蒂娜村")	
	goto diNaCunLi
::ShaLianLa::
	移动(570,275,"蒂娜村")	
	goto diNaCunLi	
::dinahanhua::
	设置("遇敌全跑",0)
	--喊话("Boss到了，请手动战斗",02,03,05)	
	if(isTeamLeader)then
		common.makeTeam(5)
		对话选是(64,51)
	else
		common.joinTeam(队长名称)
	end	
	等待(1000)
::CheckBattleReslut::
	等待空闲()
	if(取当前地图编号() == 57175)then
		日志("战斗胜利，对话boss")
		对话选是(64,51)
	end
	if(取当前地图名() == "莎莲娜" and 取物品数量("修特的项链") > 0 )then
		日志("半山1任务已完成！回城")
		回城()	
		goto begin
	end
	等待(2000)
	goto CheckBattleReslut