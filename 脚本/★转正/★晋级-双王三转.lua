★三转迷宫自动寻路脚本，起点新城!脚本阶段停止后，请重新执行脚本

队伍人数=5


sw={}

common=require("common")

function sw.teammateAction()
	
::begin::
	当前地图名 = 取当前地图名()
	x,y=取当前坐标()	
	mapNum=取当前地图编号()
	if(mapNum == 24074)then 
		goto map24074	--第六个难关过
	end		  
	if(取队伍人数() < 2)then
		if(取当前地图编号() ~= 24074)then 
			return 0
		end
	end
	等待(2000)
	goto begin
::map24074::	--boss结束
	自动寻路(20,13)
	自动寻路(22,13)
	自动寻路(20,13)
	对话选是(21,12)
	if(取当前地图名() == "莎莲娜")then
		日志("双王任务完成",1)		
	else
		goto map24074
	end	
	return 1
end


function sw.main(队长名称,队伍人数)

设置("自动战斗", 1)			-- 开启自动战斗，0不自动战斗，1自动战斗
设置("高速战斗", 1)			-- 高速战斗

if(队长名称 == nil)then
	队长名称 = 取脚本界面数据("队长名称",false)
end

if(队长名称==nil or 队长名称=="")then
	队长名称=用户输入框("请输入队伍名称！","乱￠逍遥")--风依旧￠花依然  乱￠逍遥
end
日志("队长名称："..队长名称,1)

isTeamLeader=false		--是否队长
if(人物("名称") == 队长名称)then
	isTeamLeader=true
end
if(isTeamLeader)then
	if(队伍人数 == nil)then
		队伍人数=取脚本界面数据("队伍人数")
	end
	if(队伍人数==nil or 队伍人数==0)then
		队伍人数 = 用户输入框("队伍人数，不足则固定点等待！",5)
	else
		队伍人数=tonumber(队伍人数)
	end
end


::begin::
	当前地图名 = 取当前地图名()
	x,y=取当前坐标()	
	mapNum=取当前地图编号()
	if (当前地图名=="艾尔莎岛" )then	
		goto aiersa  
	elseif (当前地图名=="里谢里雅堡" )then	
		goto libao  
	elseif (当前地图名=="阿巴尼斯村的传送点" )then	
		goto abanishi  		
	elseif (当前地图名=="莎莲娜" )then	
		goto map402  	
	elseif (当前地图名=="启程之间" )then	
		goto warproom  	
	elseif (x==72 and y==123 )then	-- 西2登录点
		goto w2
	elseif (x==233 and y==78 )then	-- 东2登录点
		goto e2
	elseif (x==162 and y==130 )then	-- 南2登录点
		goto s2
	elseif (x==63 and y==79 )then	-- 西1登录点
		goto w1
	elseif (x==242 and y==100 )then	-- 东1登录点
		goto e1
	elseif (x==141 and y==148 )then	-- 南1登录点
		goto s1
	elseif(mapNum == 402)then goto map402		--莎莲娜
	elseif(mapNum == 24008)then goto map24008	--诅咒的迷宫
	elseif(mapNum == 4320)then goto map4320	
	elseif(mapNum == 4331)then goto map4331
	elseif(mapNum == 4332)then goto map4332
	elseif(mapNum == 4333)then goto map4333
	elseif(mapNum == 4334)then goto map4334
	elseif(mapNum == 4335)then goto map4335
	elseif(mapNum == 24069)then goto map24069	--第一个难关过
	elseif(mapNum == 24070)then goto map24070	--第二个难关过
	elseif(mapNum == 24071)then goto map24071	--第三个难关过
	elseif(mapNum == 24072)then goto map24072	--第四个难关过
	elseif(mapNum == 24073)then goto map24073	--第五个难关过
	elseif(mapNum == 24074)then goto map24074	--第六个难关过
	elseif(mapNum == 24018)then goto map24018	--第一个难关
	elseif(mapNum >= 24009 and mapNum <= 24018)then goto mapCheck1	
	elseif(mapNum >= 24019 and mapNum <= 24028)then goto mapCheck2	
	elseif(mapNum >= 24029 and mapNum <= 24038)then goto mapCheck3		
	elseif(mapNum >= 24039 and mapNum <= 24048)then goto mapCheck4		
	elseif(mapNum >= 24049 and mapNum <= 24058)then goto mapCheck5		
	elseif(mapNum >= 24059 and mapNum <= 24068)then goto mapCheck6		
	elseif(mapNum == 24039)then goto map24039		
	elseif(当前地图名=="诅咒的迷宫 地下11楼" )then	
		goto two
	elseif(当前地图名=="诅咒的迷宫 地下21楼" )then	
		goto there
	elseif(当前地图名=="诅咒的迷宫 地下31楼" )then	
		goto four
	elseif(当前地图名=="诅咒的迷宫 地下41楼" )then	
		goto five
	elseif(当前地图名=="诅咒的迷宫 地下51楼" )then	
		goto six	
	elseif(当前地图名=="第四个难关" )then	
		goto next4	
	end		  
	等待(1000)
	goto begin

::aiersa::
	自动寻路(140,105)
	对话选是(1)		
	goto begin
::libao::		
	common.checkHealth(doctorName)	
	common.supplyCastle()	
	common.sellCastle()
	自动寻路(41,50,"里谢里雅堡 1楼")
::yabao1::
	自动寻路(45,20,"启程之间")
::warproom::
	等待到指定地图("启程之间")	
	自动寻路(36,4)	
	转向(2)
	dlg=等待服务器返回()
	if(dlg.message~=nil and (string.find(dlg.message,"此传送点的资格")~=nil or string.find(dlg.message,"很抱歉")~=nil ))then
		回城()
		执行脚本("./脚本/直通车/★开传送-阿巴尼斯村.lua")	
	else
		转向(2)
		等待服务器返回()
		对话选择(4,0)
	end	
	goto abanishi
::s2::			-- 南2登录点
	等待到指定地图("法兰城",162, 130)
	自动寻路(153,100)	
	goto yabao
::w1::			-- 西1登录点
	转向(0)		-- 转向北	
	等待到指定地图("法兰城", 242, 100)	
	转向(2)		-- 转向东	
	等待到指定地图("市场三楼 - 修理专区", 46, 16)	
	转向(0)		-- 转向北	
	等待到指定地图("法兰城", 141, 148)	
	自动寻路(153,101)
	自动寻路(153,100)	
	goto yabao
::s1::			-- 南1登录点
	等待到指定地图("法兰城", 141, 148)	
	自动寻路(153,101)
	自动寻路(153,100)	
	goto yabao
::e1::			-- 东1登录点
	转向(2)		-- 转向东	
	等待到指定地图("市场三楼 - 修理专区", 46, 16)	
	转向(0)		-- 转向北	
	等待到指定地图("法兰城", 141, 148)	
	自动寻路(153,101)
	自动寻路(153,100)	
	goto yabao

::e2::			-- 东2登录点
	转向(0)		-- 转向北	
	等待到指定地图("市场一楼 - 宠物交易区", 46, 16)	
	转向(0)		-- 转向北
	等待到指定地图("法兰城", 162, 130)	
	自动寻路(153,101)
	自动寻路(153,100)
	goto yabao

::w2::			-- 西2登录点
	转向(2)		-- 转向东	
	等待到指定地图("法兰城",233,78)	
	转向(0)		-- 转向北	
	等待到指定地图("市场一楼 - 宠物交易区", 46, 16)	
	转向(0)		-- 转向北	
	等待到指定地图("法兰城", 162, 130)	
	自动寻路(153,101)
	自动寻路(153,100)	
	goto yabao

::yabao::
	等待到指定地图("里谢里雅堡")
	自动寻路(34,89)
	回复(1)	
	自动寻路(41,50)	
	goto yabao1
::abanishi::
	等待到指定地图("阿巴尼斯村的传送点")	
	自动寻路(5,5)
	自动寻路(5,4)	
	等待到指定地图("村长的家",9,9)	
	自动寻路(6,9)
	自动寻路(6,12)
	移动一格(4)	
	等待到指定地图("村长的家",6,5)	
	自动寻路(6,12)
	自动寻路(6,13)
	等待到指定地图("阿巴尼斯村")
	自动寻路(40,30)
::map4320::
	if(取物品数量("刀刃的碎片") > 0)then
		自动寻路(11,17,"阿巴尼斯村")
		自动寻路(37,71,"莎莲娜")	
		goto begin
	end
	if(取物品数量("野草莓") < 1)then	
		if(取包裹空格() < 1)then 扔("魔石") end
		自动寻路(13,10)		
		对话选是(2)	
	else
		自动寻路(10,5)		
		对话选是(7)		
	end
	goto begin
::map4331::	
	自动寻路(14,7)
	对话选是(2)	
	goto begin
::map4332::	
	if(取物品数量("刀刃的碎片") <1)then
		自动寻路(14,7)		
		对话选是(2)		
	else
		自动寻路(5,3,4333)		
	end
	goto begin
::map4333::	
	自动寻路(10,4)
	自动寻路(9,4,4334)	
	goto begin
::map4334::	
	自动寻路(14,10)		
	对话选是(2)
	goto begin
::map4335::
	自动寻路(7,3,4320)	
	goto begin
	
::createTeam::
	if(isTeamLeader)then
		if(队伍("人数") < 队伍人数)then	--数量不足 等待
			common.makeTeam(队伍人数)	
		else		      
			goto begin
		end			
	else
		等待(2000)
		if(取队伍人数() > 1)then
			if(common.judgeTeamLeader(队长名称)==true) then
				if(sw.teammateAction()==1)then
					return
				end
			else
				离开队伍()
			end				
		end			
		等待(2000)
		common.joinTeam(队长名称)
		if(sw.teammateAction()==1)then
			return
		end
	end  
	goto begin
::map402::	
	if(取当前地图名() ~= "莎莲娜")then
		goto begin
	end	
	设置("遇敌全跑", 1)
	自动寻路(53,162)		
	转向(1)	
	设置("遇敌全跑", 0) 
::map24008::
	if(取当前地图名() ~= "诅咒的迷宫")then
		goto begin
	end	
	if(isTeamLeader)then
		if(队伍("人数") < 队伍人数)then	--数量不足 等待
			common.makeTeam(队伍人数)	
		else
		  自动寻路(35, 9)        
		goto one
		end			
	else
		等待(2000)
		if(取队伍人数() > 1)then
			if(common.judgeTeamLeader(队长名称)==true) then
				if(sw.teammateAction()==1)then
					return
				end
			else
				离开队伍()
			end				
		end			
		等待(2000)
		common.joinTeam(队长名称)
		if(sw.teammateAction()==1)then
			return
		end
	end  
	goto begin
::mapCheck1::
	if(队伍("人数") < 2)then
		goto createTeam
	end
	mapNum=取当前地图编号()
	if(mapNum == 24009)then goto map24009	
	elseif(mapNum == 24010)then goto map24010	
	elseif(mapNum == 24011)then goto map24011	
	elseif(mapNum == 24012)then goto map24012	
	elseif(mapNum == 24013)then goto map24013	
	elseif(mapNum == 24014)then goto map24014	
	elseif(mapNum == 24015)then goto map24015	
	elseif(mapNum == 24016)then goto map24016	
	elseif(mapNum == 24017)then goto map24017	
	elseif(mapNum == 24018)then goto map24018	
	end
	goto begin
::one::
::map24009::		--诅咒的迷宫 地下1楼
	自动寻路(25, 13)     
	goto mapCheck1
::map24010::		--诅咒的迷宫 地下2楼     
    自动寻路(17, 4)      
	goto mapCheck1
::map24011::		--诅咒的迷宫 地下3楼  
	自动寻路(23, 20)	
	goto mapCheck1
::map24012::		--诅咒的迷宫 地下4楼	
	自动寻路(16, 10)	
	goto mapCheck1
::map24013::		--诅咒的迷宫 地下5楼	
	自动寻路(6, 3)	
	goto mapCheck1
::map24014::		--诅咒的迷宫 地下6楼	      
	自动寻路(15, 3)	
	goto mapCheck1
::map24015::		--诅咒的迷宫 地下7楼	
	自动寻路(25, 18)	
	goto mapCheck1
::map24016::		--诅咒的迷宫 地下8楼
	自动寻路(14, 18)	
	goto mapCheck1
::map24017::		--诅咒的迷宫 地下9楼	
	自动寻路(24, 4,"第一个难关")	
	goto mapCheck1
::map24018::
	等待到指定地图("第一个难关")
	自动寻路(21, 18)
	等待(1000)
    喊话("调教、宠物强化、精灵的盟约8级可以通过。",2,3,5)
	自动寻路(22,15)
	对话选是(0)
	goto next1
::map24069::

::next1::
	if(取当前地图名() == "诅咒的迷宫 地下11楼")then
		goto begin
	end
	等待(1000)
	goto next1
	

::mapCheck2::
	if(队伍("人数") < 2)then
		goto createTeam
	end
	mapNum=取当前地图编号()
	if(mapNum == 24019)then goto map24019	
	elseif(mapNum == 24020)then goto map24020	
	elseif(mapNum == 24021)then goto map24021	
	elseif(mapNum == 24022)then goto map24022	
	elseif(mapNum == 24023)then goto map24023	
	elseif(mapNum == 24024)then goto map24024	
	elseif(mapNum == 24025)then goto map24025	
	elseif(mapNum == 24026)then goto map24026	
	elseif(mapNum == 24027)then goto map24027	
	elseif(mapNum == 24028)then goto map24028			
	end
	goto begin
	
::two::
::map24019::		--诅咒的迷宫 地下11楼	
	自动寻路(15, 4)
	goto mapCheck2
::map24020::		--诅咒的迷宫 地下12楼
	自动寻路(24, 15)
	goto mapCheck2
::map24021::		--诅咒的迷宫 地下13楼	
	自动寻路(16, 3)
	goto mapCheck2
::map24022::		--诅咒的迷宫 地下14楼	
	自动寻路(25, 12)
	goto mapCheck2
::map24023::		--诅咒的迷宫 地下15楼	
	if(目标是否可达(22,5))then
		自动寻路(22, 5)
	end
	if(目标是否可达(25,21))then
		自动寻路(25, 21)
	end
	goto mapCheck2
::map24024::		--诅咒的迷宫 地下16楼
	if(目标是否可达(17, 18))then
		自动寻路(17, 18)
		goto mapCheck2
	end
	if(目标是否可达(22, 18))then
		自动寻路(22, 18)
		goto mapCheck2
	end
	goto mapCheck2
::map24025::		--诅咒的迷宫 地下17楼
	自动寻路(23, 4)
	goto mapCheck2
::map24026::		--诅咒的迷宫 地下18楼
	自动寻路(7, 12)
	goto mapCheck2
::map24027::		--诅咒的迷宫 地下19楼
	自动寻路(18, 18)
	goto mapCheck2
::map24028::
	等待到指定地图("第二个难关")	
	自动寻路(22, 17)
	等待(1000)
	喊话("攻击魔法技能8级可以通过。",2,3,5)
	自动寻路(25, 17)
	对话选是(2)
	goto next2

::next2::
	if(是否战斗中())then
		等待战斗结束()
	end
	if(取当前地图名() == "诅咒的迷宫 地下21楼")then
		goto begin
	end    
	if(取当前地图名() == "第二个难关")then
		if(目标是否可达(30,5))then
			自动寻路(30,5)
		else			
			自动寻路(25, 17)
			转向(2)
		end
	end 	
	等待(1000)
	goto begin
::map24070::
	if(目标是否可达(30,5))then
		自动寻路(25,17)
	end
	goto begin


::mapCheck3::
	if(队伍("人数") < 2)then
		goto createTeam
	end
	mapNum=取当前地图编号()
	if(mapNum == 24029)then goto map24029	
	elseif(mapNum == 24030)then goto map24030	
	elseif(mapNum == 24031)then goto map24031	
	elseif(mapNum == 24032)then goto map24032	
	elseif(mapNum == 24033)then goto map24033	
	elseif(mapNum == 24034)then goto map24034	
	elseif(mapNum == 24035)then goto map24035	
	elseif(mapNum == 24036)then goto map24036	
	elseif(mapNum == 24037)then goto map24037	
	elseif(mapNum == 24038)then goto map24038	
	elseif(mapNum == 24039)then goto map24039			
	end
	goto begin
::there::
::map24029::		--诅咒的迷宫 地下21楼	
    自动寻路(20, 3)
	goto mapCheck3
::map24030::		--诅咒的迷宫 地下22楼          
	if(目标是否可达(7, 4))then
		自动寻路(7, 4)
		goto mapCheck3
	end
	if(目标是否可达(17, 12))then
		自动寻路(17, 12)
		goto mapCheck3
	end
	goto mapCheck3
::map24031::		--诅咒的迷宫 地下23楼  
	if(目标是否可达(14, 12))then
		自动寻路(14, 12)
		goto mapCheck3
	end
	if(目标是否可达(22, 18))then
		自动寻路(22, 18)
		goto mapCheck3
	end
	if(目标是否可达(27, 2))then
		自动寻路(27, 2)
		goto mapCheck3
	end
	goto mapCheck3
::map24032::		--诅咒的迷宫 地下24楼		
	自动寻路(7, 20)
	goto mapCheck3
::map24033::		--诅咒的迷宫 地下25楼
	自动寻路(24, 20)
	goto mapCheck3
::map24034::		--诅咒的迷宫 地下26楼	
	自动寻路(17, 5)
	goto mapCheck3
::map24035::		--诅咒的迷宫 地下27楼
	if(目标是否可达(9, 11))then
		自动寻路(9, 11)
		goto mapCheck3
	end
	if(目标是否可达(23, 16))then
		自动寻路(23, 16)
		goto mapCheck3
	end
	goto mapCheck3
::map24036::		--诅咒的迷宫 地下28楼
	if(目标是否可达(25, 21))then
		自动寻路(25, 21)
		goto mapCheck3
	end	
	if(目标是否可达(16, 12))then
		自动寻路(16, 12)
		goto mapCheck3
	end
	goto mapCheck3
::map24037::		--诅咒的迷宫 地下29楼
	自动寻路(7, 1)
	goto mapCheck3
::map24038::
	等待到指定地图("第三个难关")	
	自动寻路(21, 17)
	等待(1000)
	喊话("乾坤、连击、反击、乱射、气功弹、阳炎、暗杀、圣盾、混乱攻击技能8级可以通过。",2,3,5)	
	自动寻路(20,20)
	对话选是(20,21)
	goto next3

::next3::
	if(是否战斗中())then
		等待战斗结束()
	end
    if(取当前地图名() == "诅咒的迷宫 地下31楼")then
		goto begin
	end  
	if(取当前地图名() == "第三个难关")then
		if(目标是否可达(20,28))then
			自动寻路(20,28)
		else			
			自动寻路(20, 20)
			转向(4)
		end 	
	end
	等待(1000)
	goto begin
::map24071::
	if(目标是否可达(20,28))then
		自动寻路(20,28)	
	end 	
	goto begin

::mapCheck4::
	if(队伍("人数") < 2)then
		goto createTeam
	end
	等待空闲()
	等待(500)
	mapNum=取当前地图编号()
	if(mapNum == 24039)then goto map24039	
	elseif(mapNum == 24040)then goto map24040	
	elseif(mapNum == 24041)then goto map24041	
	elseif(mapNum == 24042)then goto map24042	
	elseif(mapNum == 24043)then goto map24043	
	elseif(mapNum == 24044)then goto map24044	
	elseif(mapNum == 24045)then goto map24045	
	elseif(mapNum == 24046)then goto map24046	
	elseif(mapNum == 24047)then goto map24047	
	elseif(mapNum == 24048)then goto map24048	
	end
	goto begin
::four::
::map24039::
	等待到指定地图("诅咒的迷宫 地下31楼")
	自动寻路(24, 13)
	goto mapCheck4
::map24040::
	等待到指定地图("诅咒的迷宫 地下32楼")	
	自动寻路(15, 12)
	goto mapCheck4
::map24041::			--诅咒的迷宫 地下33楼
	if(目标是否可达(6,13))then	
		自动寻路(6, 13)
	elseif(目标是否可达(24,12))then	
		自动寻路(24, 12)	
	end
	goto mapCheck4
::map24042::
	if(目标是否可达(9,21))then	
		自动寻路(9, 21)
	elseif(目标是否可达(23,4))then	
		自动寻路(23, 4)
	end
	goto mapCheck4
::map24043::
	等待到指定地图("诅咒的迷宫 地下35楼", 1)
	自动寻路(6, 13)
	goto mapCheck4
::map24044::
	等待到指定地图("诅咒的迷宫 地下36楼", 1)
	自动寻路(9, 21)
	goto mapCheck4
::map24045::
	等待到指定地图("诅咒的迷宫 地下37楼", 1)
	自动寻路(24, 21)
	goto mapCheck4
::map24046::
	等待到指定地图("诅咒的迷宫 地下38楼", 1)
	自动寻路(8, 21)
	goto mapCheck4
::map24047::
	等待到指定地图("诅咒的迷宫 地下39楼", 1)
	自动寻路(23, 25)
	goto mapCheck4
::map24048::
	等待到指定地图("第四个难关", 1)        
	自动寻路(19, 18)
	等待(2000)
	喊话("补血、气绝、恢复、洁净技能8级可以通过。",2,3,5)
	goto next4

::next4::
	if(是否战斗中())then
		等待战斗结束()
	end 	
	if(取当前地图名() == "诅咒的迷宫 地下41楼")then
		goto begin
	end        
	if(取当前地图名() == "第四个难关")then
		if(目标是否可达(16,18))then				
			自动寻路(16, 18)
			对话选是(6)
		end 	
		if(目标是否可达(29,26))then				
			自动寻路(29,26)		
		end 	
	end
	等待(1000)
	goto begin
::map24072::			
	自动寻路(29,26)	
	goto begin
	
::mapCheck5::
	if(队伍("人数") < 2)then
		goto createTeam
	end
	mapNum=取当前地图编号()
	if(mapNum == 24049)then goto map24049	
	elseif(mapNum == 24050)then goto map24050	
	elseif(mapNum == 24051)then goto map24051	
	elseif(mapNum == 24052)then goto map24052	
	elseif(mapNum == 24053)then goto map24053	
	elseif(mapNum == 24054)then goto map24054	
	elseif(mapNum == 24055)then goto map24055	
	elseif(mapNum == 24056)then goto map24056	
	elseif(mapNum == 24057)then goto map24057	
	elseif(mapNum == 24058)then goto map24058	
	end
	goto begin
::five::
::map24049::
	等待到指定地图("诅咒的迷宫 地下41楼")	
	自动寻路(8, 18)
::map24050::
	等待到指定地图("诅咒的迷宫 地下42楼")
	自动寻路(24, 21)
::map24051::
	等待到指定地图("诅咒的迷宫 地下43楼")	
	自动寻路(23, 4)
::map24052::
	等待到指定地图("诅咒的迷宫 地下44楼")
	自动寻路(24, 21)
::map24053::
	等待到指定地图("诅咒的迷宫 地下45楼")
	自动寻路(26, 9)
::map24054::
	等待到指定地图("诅咒的迷宫 地下46楼")
	自动寻路(9, 2)
::map24055::
	等待到指定地图("诅咒的迷宫 地下47楼")
	自动寻路(22, 3)
::map24056::
	等待到指定地图("诅咒的迷宫 地下48楼")
	自动寻路(17, 12)
::map24057::
	等待到指定地图("诅咒的迷宫 地下49楼")
	自动寻路(9, 2)
::map24058::
	等待到指定地图("第五个难关")
	自动寻路(21, 18)
	等待(2000)
	喊话("咒术、抵抗、抑制技能8级可以通过。",2,3,5)
	goto next5

::next5::
	if(是否战斗中())then
		等待战斗结束()
	end 	
    if(取当前地图名() == "诅咒的迷宫 地下51楼")then
		goto begin
	end    	    
	if(取当前地图名() == "第五个难关")then
		if(目标是否可达(24,4))then
			自动寻路(24,4)
		else			
			自动寻路(22, 15)		
			对话选是(0)
		end 	
	end
	等待(1000)
	goto begin
::map24073::
	自动寻路(24,4)
	goto begin

::mapCheck6::
	if(队伍("人数") < 2)then
		goto createTeam
	end
	等待(1500)
	mapNum=取当前地图编号()
	if(mapNum == 24059)then goto map24059	
	elseif(mapNum == 24060)then goto map24060	
	elseif(mapNum == 24061)then goto map24061	
	elseif(mapNum == 24062)then goto map24062	
	elseif(mapNum == 24063)then goto map24063	
	elseif(mapNum == 24064)then goto map24064	
	elseif(mapNum == 24065)then goto map24065	
	elseif(mapNum == 24066)then goto map24066	
	elseif(mapNum == 24067)then goto map24067	
	elseif(mapNum == 24068)then goto map24068	
	elseif(mapNum == 24074)then goto map24074	
	end
	
	goto begin
::map24059::
::six::
	等待到指定地图("诅咒的迷宫 地下51楼")
	自动寻路(25, 23)
::map24060::
	等待到指定地图("诅咒的迷宫 地下52楼")
	自动寻路(23, 4)
::map24061::			--诅咒的迷宫 地下53楼
	if(目标是否可达(25, 23))then
		自动寻路(25, 23)
	end
	if(目标是否可达(15, 5))then
		自动寻路(15, 5)
	end
	goto mapCheck6
	
::map24062::	--诅咒的迷宫 地下54楼	
	if(目标是否可达(23, 4))then
		自动寻路(23, 4)
	end
	if(目标是否可达(13, 14))then
		自动寻路(13, 14)
	end	
	if(目标是否可达(15, 11))then
		自动寻路(15, 11)
	end
	goto mapCheck6
	
::map24063::		--诅咒的迷宫 地下55楼
	if(目标是否可达(19, 17))then
		自动寻路(19, 17)
	end	
	if(目标是否可达(15, 8))then
		自动寻路(15, 8)
	end
	goto mapCheck6	
::map24064::
	if(目标是否可达(25, 12))then
		自动寻路(25, 12)
	end	
	if(目标是否可达(20, 15))then
		自动寻路(20, 15)
	end	
	-- 等待到指定地图("诅咒的迷宫 地下56楼", 15, 8)
	-- 自动寻路(25, 12)
	goto mapCheck6	
::map24065::
	等待到指定地图("诅咒的迷宫 地下57楼")	
	if(目标是否可达(23, 3))then
		自动寻路(23, 3)
	elseif(目标是否可达(13, 15))then
		自动寻路(13, 15)
	end
	goto mapCheck6	
::map24066::
	等待到指定地图("诅咒的迷宫 地下58楼")	
	if(目标是否可达(18, 25))then
		自动寻路(18, 25)
	end	
	if(目标是否可达(20, 15))then
		自动寻路(20, 15)
	end
	goto mapCheck6	
::map24067::
	等待到指定地图("诅咒的迷宫 地下59楼")	
	自动寻路(8, 13)
	goto mapCheck6	
::map24068::
	等待到指定地图("第六个难关")      	
	自动寻路(19, 18)
	日志("打Boss了哦",1)
	自动寻路(23,19)
	转向(2)
	等待(5000)
	if(是否战斗中())then
		等待战斗结束()
	end
	goto mapCheck6	
::map24074::	--boss结束
	if(isTeamLeader)then 
		自动寻路(20,13)
		自动寻路(22,13)
		自动寻路(20,13)
		对话选是(21,12)
	else
		对话选是(21,12)
	end
	if(取当前地图名() == "莎莲娜")then
		日志("双王任务完成",1)		
	end
end

sw.main()
return sw        



