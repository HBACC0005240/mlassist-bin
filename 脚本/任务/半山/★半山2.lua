★半山2脚本，起点艾尔莎岛登入点


common=require("common")

local 队长名称=取脚本界面数据("队长名称")
if(队长名称==nil or 队长名称=="")then
	队长名称=用户输入框("请输入队伍名称！","风依旧￠花依然")--风依旧￠花依然  乱￠逍遥
end
local 队伍人数=取脚本界面数据("队伍人数")
local isTeamLeader=false
if(人物("名称",false) == 队长名称)then
	isTeamLeader=true
	日志("当前是队长:"..人物("名称",false),1)
	if(队伍人数==nil or 队伍人数==0)then
		队伍人数 = 用户输入框("队伍人数",5)
	else
		队伍人数=tonumber(队伍人数)
	end
	日志("队伍人数:"..队伍人数,1)
	
else	
	日志("当前是队员:"..人物("名称",false),1)	
end	



清除系统消息()
function checkTeammateItem(chatMsg)
	if(chatMsg==nil)then return end
	local teamPlayers = 队伍信息()
	local teammateCount = common.getTableSize(teamPlayers)
	local count=0
::begin::	
	for index,teamPlayer in ipairs(teamPlayers) do
		if(string.find(聊天(50),teamPlayer.name..": "..chatMsg)~=nil)then 
			count=count+1
		end			
	end  
	if(count>=(teammateCount-1))then
		return
	end		
	count=0
	goto begin
	
end
function checkTitle()
	player=人物信息()
	for i,title in ipairs(player.titles) do
		if(title.name == "追查真相中")then
			return true
		end
	end
	return false
end
function map57180()	--地下实验室
	移动(19,11)
	对话选是(0)
end
function map57181()	--瑞娜的家 57181
	移动(11,13)
	对话选是(0)
	喊话("阿鲁卡那斯",3,4,5)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(1,0)
end
function main()
	停止遇敌()	
::begin::	
	等待空闲()	
	local 当前地图名 = 取当前地图名()
	mapNum = 取当前地图编号()
	if (当前地图名 =="艾尔莎岛" )then goto toIsland
	elseif(当前地图名 ==  "里谢里雅堡")then goto toIsland 
	elseif(当前地图名 ==  "里谢里雅堡 1楼")then goto toIsland 
	elseif(当前地图名 ==  "法兰城")then goto toIsland 	
	elseif(当前地图名 ==  "图书室")then goto library
	elseif(当前地图名 ==  "小岛")then goto island			--57176
	elseif(当前地图名 ==  "莎莲娜")then goto shalianla
	elseif(当前地图名 ==  "圣玛丽亚号")then goto shape
	elseif(当前地图名 ==  "深海秘窟")then leaderAction()
	elseif(mapNum ==  57180)then 
		map57180() 
		map57181()
	elseif(mapNum ==  57181)then 
		map57181()
		goto begin
	end		
	--回城()
	等待(2000)
	goto begin
::library::					--图书室
	移动(18,18)
	对话选是(18,19)
	if(取物品数量("491676") >0 ) then	--修特的项链
		使用物品("修特的项链")
		等待服务器返回()
		对话选择(1,0)
		等待(2000)
		回城()
	end
	goto begin
::toIsland::
	common.checkHealth()	
	common.supplyCastle()
	common.sellCastle()		--默认卖
	isHaveTitle=checkTitle()
	if(isHaveTitle==false)then	--半山1交任务
		common.toCastle("f1")
		移动(80,18)
		对话选是(81,18)
		isHaveTitle=checkTitle()
		if(isHaveTitle==false)then	
			日志("没有半山1称号，脚本退出！",1)
			return
		end
	end	
	if(取物品数量("项链的情报") > 0 and 取物品数量("止吐药") > 0 )then 		
		扔("项链的情报")
		扔("止吐药")
		等待(3000)
		goto begin			
	end
	if(取物品数量("项链的情报") > 0 and 取物品数量("航海图") > 0 )then 		
		common.toTeleRoom("杰诺瓦镇")
		goto jiecun			
	end
	if(取物品数量("航海图") == 0)then		
		common.toCastle("f2")
		移动(0,74,"图书室")		
		goto library
	end
	
	goto begin
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
::shalianla::
	设置("遇敌全跑",1)
	等待到指定地图("莎莲娜")	
	移动(668,319)	
	对话选是(669,319)
	goto shape
::shape::			--57179
	移动(43,25)
	对话选是(44,25)	
	if(取当前地图名() == "小岛")then
		goto island
	end
	等待(10000)
	goto shape
::island::
	if(取当前地图名() ~= "小岛")then
		goto begin
	end
	设置("遇敌全跑",0)
	if(isTeamLeader)then
		leaderAction()		
	else
		teammateAction()
	end	
end	
function nachocolate()
	if(是否目标附近(70,81))then
		对话选否(70,81)		
	end		
	if(取物品数量("巧克力") > 0)then
		喊话("已拿到巧克力",2,3,5)
	end
end
--队长
function leaderAction()
::begin::	
	等待空闲()	
	local 当前地图名 = 取当前地图名()
	mapNum = 取当前地图编号()
	if (string.find(当前地图名,"达尔文海")~= nil )then goto crossMaze	
	elseif(当前地图名 ==  "小岛")then goto island
	elseif(当前地图名 ==  "深海秘窟")then goto boss	
	elseif(mapNum ==  57180)then map57180()
	elseif(mapNum ==  57181)then map57181()
	end		
	等待(1000)
	goto begin
::island::
	if(取当前地图名() ~= "小岛")then
		goto begin
	end
	if(队伍("人数") ~= 队伍人数)then
		移动(66, 97)
		common.makeTeam(队伍人数)
		goto begin
	end
	if(取物品数量("机器零件") > 0)then
		goto fini
	end
	if(取物品数量("金属探测仪") > 0)then
		if(取物品数量("星鳗饭团") > 0)then
			移动(81,20)
			对话选是(82,20)	
			goto toMaze
		else
			移动(55,80)
			对话选是(55,81)
		end	
	else
		if(取物品数量("巧克力") > 0)then
			移动(58,78)
			移动(58,77)
			移动(58,78)
			移动(58,77)
			移动(58,78)
			对话选是(59,78)	--金属探测仪
			if(取物品数量("金属探测仪") > 0)then
				checkTeammateItem("已拿到金属探测仪")	
			else
				goto island
			end		
		else
			移动(69,81)
			移动(69,80)
			移动(69,81)
			移动(69,80)
			移动(69,81)
			nachocolate()
			if(取物品数量("巧克力") > 0)then
				checkTeammateItem("已拿到巧克力")	
			else
				goto island
			end			
		end	
	end
	goto begin
::toMaze::
	移动(121, 20,"达尔文海海底地下1楼")
	goto crossMaze
::crossMaze::
	自动穿越迷宫("深海秘窟")
	if(取当前地图名()=="深海秘窟")then
		goto boss
	end
	等待(1000)
	goto crossMaze
::boss::
	if(取当前地图名() ~= "深海秘窟")then
		goto begin
	end
	移动(19,17)
	对话选是(20,17)
	等待(2000)	
	if(取当前地图名() == "小岛")then
		goto fini		
	end
	goto boss
::fini::
	if(队伍("人数") ~= 队伍人数)then
		移动(82,22)
		common.makeTeam(队伍人数)
		goto fini
	end	
	移动(58,78)
	移动(58,77)
	移动(58,78)
	移动(58,77)
	移动(58,78)
	对话选是(59,78)	
	等待(2000)
	对话选是(59,78)	--地下实验室  57180
	map57180()
	等待(2000)
	map57181()
	
	
end
function teammateAction()
::begin::	
	等待空闲()	
	mapNum = 取当前地图编号()
	local 当前地图名 = 取当前地图名()
	if(当前地图名 ==  "小岛")then goto island
	elseif(当前地图名 ==  "深海秘窟")then goto boss	
	elseif(mapNum ==  57180)then map57180()
	elseif(mapNum ==  57181)then map57181()
	end		
	等待(3000)
	goto begin
::island::
	if(取当前地图名() ~= "小岛")then
		goto begin
	end		
	
	if(是否目标附近(59,78,2))then			
		if(取物品数量("匆忙写下的笔录") > 0)then
			日志("已拿到半山3任务物品",1)
		end
		if(取物品数量("金属探测仪") > 0)then
			喊话("已拿到金属探测仪",2,3,5)
		else
			对话选是(59,78)				
		end			
	end	
	if(是否目标附近(70,81))then
		if(取物品数量("巧克力") > 0)then
			喊话("已拿到巧克力",2,3,5)
		else
			对话选否(70,81)
		end		
	end
	if(取队伍人数() < 2 and 取当前地图名() == "小岛")then	
		common.joinTeam(队长名称)
	end		
	goto begin
::boss::
	if(取当前地图名() ~= "深海秘窟")then
		goto begin
	end		
	if(是否目标附近(20, 17))then
		对话选是(20, 17)
	end				
	goto begin
end
main()