--package.path = package.path ..';..\\?.lua';
--local falan = require("yd")
--mymodule:qyd()
--执行脚本("M:/MyPro/GitHub/SoEasy/bin/脚本/直通车/法兰.lua")
function 去里谢堡()
	print(取当前地图名())
	if (取当前地图名()~="艾尔莎岛" )then	
		回城()		
		等待(1500)
	end
	::重新对话::
	自动寻路(140,105)
	转向(1)
	等待服务器返回()
	对话选择(4,0)
	等待(1000)	--等待对话完毕 切图完成

	if (取当前地图名()~="里谢里雅堡" )then
		goto 重新对话
	end
end
function 出发()
	x,y=取当前坐标()		
	if( x == 690 and y == 285) then		--捕捉点
		return
	end			
	if (取当前地图名()=="艾尔莎岛" )then	
		去里谢堡()
	end	
	if (取当前地图名()=="里谢里雅堡" )then	
		自动寻路(34,89)
		转向(1)--加血
		等待(3500)
		自动寻路(41, 53)	
		自动寻路(41,50,"里谢里雅堡 1楼")
	end		
	if (取当前地图名()=="里谢里雅堡 1楼" )then	
		自动寻路(45,20,"启程之间")
	end	
	if (取当前地图名()=="启程之间" )then	
		自动寻路(44,33)
		转向(0)
		等待服务器返回()
		对话选择(4,0)
		等待(1000)
		自动寻路(12,17,"村长的家")
		自动寻路(6,13,"伊尔村")
		自动寻路(45,31,"芙蕾雅")
	end			
	if (取当前地图名()=="芙蕾雅" )then	
		自动寻路(690,285)		
	end
end
function 买封印卡()
	去里谢堡()
	自动寻路(17,53,"法兰城")		
	自动寻路(94,78,"达美姊妹的店")		
	自动寻路(17,18)
	等待(1000)
	转向(2)
	等待服务器返回()
	对话选择(0,0) --第二个参数0 0买 1卖 2不用了
	等待服务器返回()
	购买(3,20)
	回城()
end
function 回补()
	停止遇敌()
	等待(3000)
	回城()
end
function 状态判断()	
	while true do
		if (人物("血") < 100 )then		
			return
		elseif (人物("魔") < 100 )then	
			return
		elseif (宠物("血") < 100 )then	
			return
		elseif (宠物("魔") < 100 )then	
			return
		elseif 是否战斗中() then
			遇敌总次数=遇敌总次数+1
			等待战斗结束()
		end		
		等待(1000)
	end
end

function _SMain()
	设置("timer",100)
	设置脚本简介("★捉水龙脚本，起点艾尔莎岛登入点，请设置好自动战斗,战斗1中设置好遇一级宠时的战斗方法 战斗2设置好宠物满下线保护，谢谢支持魔力辅助程序.脚本发现BUG联系Q:274100927星落")
	debugMsg("1234")
	配置="./配置/"..人物("名称")..".save"
	调试(配置)	
--	读取配置("./配置/"..人物("名称")..".save")	
	执行脚本("脚本/直通车/★公交车-营地直通车.lua")
	去营地()
	调试("chufa")
	调试(人物("血"))
	调试(人物("魔"))
	调试(人物("maxhp"))
	调试(人物("maxmp"))
	调试(人物("level"))
	调试(宠物("血"))
	调试(宠物("魔"))
	人物补血值=用户输入框("人物补血值","500")
	调试(人物补血值)
	if 人物("血") < 人物补血值 then
		调试("人物血小于")
		return
	end			
	遇敌总次数=0
	while true do
		if(取物品数量("封印卡（昆虫系）") < 1) then--判断是否需要买卡
			买封印卡()
		end
		出发()
		开始遇敌()
		状态判断()
		回补()
		等待(1000)
	end
    切换脚本("新手任务30-35级.lua")
end
_SMain()