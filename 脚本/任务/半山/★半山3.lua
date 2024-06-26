★半山3脚本，起点艾尔莎岛登入点，根据提示执行脚本

common=require("common")
设置("自动战斗", 1)			-- 开启自动战斗，0不自动战斗，1自动战斗
设置("高速战斗", 1)			-- 开启高速战斗
设置("高速延时", 4)			-- 高速战斗速度，0不延时 



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



function map57180()	--地下实验室
	自动寻路(19,11)
	对话选是(0)
end
function map57181()	--瑞娜的家 57181
	自动寻路(11,13)
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

function main()
::begin::
	停止遇敌()	
	等待空闲()
	local 当前地图名 = 取当前地图名()
	local x,y=取当前坐标()	
	mapNum = 取当前地图编号()
	--营地任务()
	if (string.find(当前地图名,"通往山顶的路")~= nil )then goto crossMaze
	elseif (当前地图名 =="艾尔莎岛" )then goto toIsland
	elseif(当前地图名 ==  "里谢里雅堡")then goto toIsland 
	elseif(当前地图名 ==  "法兰城")then goto toIsland 	
	elseif(当前地图名 ==  "小岛")then goto island
	elseif(当前地图名 ==  "图书室")then goto library
	elseif(当前地图名 ==  "圣鸟之巢")then goto birdnest
	elseif(当前地图名 ==  "圣山之巅")then goto mountainPeak
	elseif(当前地图名 ==  "杰诺瓦镇的传送点")then goto jiecun
	elseif(当前地图名 ==  "蒂娜村的传送点")then goto dina
	elseif(当前地图名 ==  "莎莲娜")then goto map400
	elseif(当前地图名 ==  "半山腰")then leaderAction()
	elseif(mapNum ==  57180)then map57180()
	elseif(mapNum ==  57181)then map57181()
	elseif(mapNum ==  57185)then map57185() --打完boss
	else 回城()	end		
	等待(2000)
	goto begin
::toIsland::	
	common.checkHealth()
	common.supplyCastle()	
	common.sellCastle()		--默认卖
	if(取物品数量("鸟类大全") > 0)then	
		common.toTeleRoom("杰诺瓦镇")
		goto jiecun			
	end
	if(取物品数量("匆忙写下的笔录") > 0)then	
		common.toCastle("f2")
		自动寻路(0,74,"图书室")		
		goto library		
	end
	if(取物品数量("暗号") > 0)then	
		common.toTeleRoom("杰诺瓦镇")
		goto jiecun			
	end
	common.toTeleRoom("杰诺瓦镇")		
	goto begin
::jiecun::	
	等待到指定地图("杰诺瓦镇的传送点")	
	自动寻路(14, 8)
	自动寻路(14, 6)
	等待到指定地图("村长的家")
	自动寻路(13, 9)
	自动寻路(1, 9)
	等待到指定地图("杰诺瓦镇")
	自动寻路(54, 43)
	自动寻路(54, 35)
	自动寻路(71, 18)
::map400::
	设置("遇敌全跑",1)
	等待到指定地图("莎莲娜")	
	自动寻路(668,319)	
	对话选是(669,319)
	goto island	
::dina::
	等待到指定地图("蒂娜村的传送点")	
	自动寻路(11, 2,4214)
	自动寻路(7, 1,4213)
	自动寻路(1, 7,4212)
	自动寻路(1, 6,4200)
	自动寻路(43, 62,"莎莲娜")	
	设置("遇敌全跑",1)	
	自动寻路(668,319)	
	对话选是(669,319)
	goto island	
::library::					--图书室
	自动寻路(18,18)
	对话选是(18,19)
	if(取物品数量("鸟类大全") > 0)then	
		common.toTeleRoom("杰诺瓦镇")
		goto jiecun			
	end
	goto begin
::island::
	if(取当前地图名() ~= "小岛")then
		goto begin
	end
	if(取物品数量("匆忙写下的笔录") > 0)then
		回城()
		goto begin
		common.toCastle("f2")
		自动寻路(0,74,"图书室")		
		goto library		
	end
	设置("遇敌全跑",0)
	if(isTeamLeader)then
		leaderAction()		
	else
		teammateAction()
	end	
	
	goto crossMaze
::crossMaze::
	自动穿越迷宫("圣鸟之巢")
	if(取当前地图名()=="圣鸟之巢")then
		goto birdnest
	end
	等待(1000)
	goto crossMaze
::birdnest::
	if(取当前地图名() ~= "圣鸟之巢")then
		goto begin
	end
	if(isTeamLeader)then
		leaderAction()		
	else
		teammateAction()
	end	
	-- 自动寻路(14,12)
	-- 对话选是(14,11)
	-- 喊话("我是来送鳗鱼饭的",2,3,5)
	-- 等待服务器返回()
	-- 对话选择(1,0)
	-- 等待(2000)		
	goto begin
::mountainPeak::
	if(取当前地图名() ~= "圣山之巅")then
		goto begin
	end
	if(isTeamLeader)then
		leaderAction()		
	else
		teammateAction()
	end	
	goto begin
	-- 自动寻路(23,23)
	-- 对话选是(23,22)
	-- if(取当前地图名() == "法兰城")then
		-- 日志("任务结束，可以去半山练级了",1)
	-- end
	-- 日志("任务完成，但没有传送至法兰城，请手动查看问题",1)
end
	
function map57185()
	自动寻路(23,23)
	对话选是(23,22)
end
--队长
function leaderAction()
::begin::	
	等待空闲()	
	local 当前地图名 = 取当前地图名()
	mapNum = 取当前地图编号()
	if (string.find(当前地图名,"达尔文海")~= nil )then goto crossMaze	
	elseif(当前地图名 ==  "小岛")then goto island
	elseif(当前地图名 ==  "圣鸟之巢")then goto anhao	
	elseif(当前地图名 ==  "圣山之巅")then goto boss	
	elseif(当前地图名 ==  "半山腰")then 自动寻路(78,52)
	elseif(mapNum ==  57180)then map57180()
	elseif(mapNum ==  57181)then map57181()
	elseif(mapNum ==  57185)then map57185()
	end		
	等待(1000)
	goto begin
::island::
	if(取当前地图名() ~= "小岛")then
		goto begin
	end
	if(队伍("人数") ~= 队伍人数)then
		自动寻路(66, 97)	
		common.makeTeam(队伍人数)
		goto island
	end	
	if(取物品数量("暗号") > 0)then		
		checkTeammateItem("已拿到暗号")
		自动寻路(54,80)
		自动寻路(56,80)
		自动寻路(54,80)
		自动寻路(56,80)
		if(取物品数量("星鳗饭团") < 1)then
			对话选是(55,81)
		end
		if(取物品数量("星鳗饭团") > 0)then
			checkTeammateItem("已拿到星鳗饭团")
		end		
		goto toMaze
	else
		if(取物品数量("鸟类大全") > 0)then
			自动寻路(78, 88)
			自动寻路(78, 87)
			自动寻路(78, 88)
			自动寻路(78, 87)
			自动寻路(78, 88)		
			对话选是(79, 88)	--暗号
			if(取物品数量("暗号") > 0)then
				checkTeammateItem("已拿到暗号")
			end			
		elseif(取物品数量("匆忙写下的笔录") > 0)then
			回城()
			return
		else
			自动寻路(58,78)
			自动寻路(58,77)
			自动寻路(58,78)
			自动寻路(58,77)
			自动寻路(58,78)
			对话选是(59,78)	
			等待(2000)
			对话选是(59,78)	--地下实验室  57180
			map57180()
			等待(2000)
			map57181()
		end	
	end	
	goto begin
::toMaze::
	自动寻路(64,45,"通往山顶的路100M")
	goto crossMaze
::crossMaze::
	自动穿越迷宫("圣鸟之巢")
	if(取当前地图名()=="圣鸟之巢")then
		goto anhao
	end
	if(取当前地图名()=="半山腰")then
		自动寻路(78,52)
	end
	等待(1000)
	goto crossMaze
::anhao::
	if(取当前地图名() ~= "圣鸟之巢")then
		goto begin
	end
	自动寻路(13, 11)
	自动寻路(13, 10)
	自动寻路(13, 11)
	自动寻路(13, 10)
	自动寻路(13, 11)
	对话选是(14,11)
	喊话("我是来送鳗鱼饭的",2,3,5)
	等待服务器返回()
	对话选择(1,0)
	等待(2000)		
	goto begin
::boss::
	if(取当前地图名() ~= "圣山之巅")then
		goto begin
	end
	if(取当前地图编号() == 57185)then 
		map57185() 
	else
		自动寻路(32,27)	
		if(队伍("人数") ~= 队伍人数)then		
			common.makeTeam(队伍人数)
			goto boss
		end	
		自动寻路(23,23)
		对话选是(23,22)
	end	
	if(是否战斗中())then
		等待战斗结束()
		if(取当前地图名() == "小岛")then
			日志("半山3任务完成")
			return
		end
	end
	goto begin	
end
function teammateAction()
::begin::	
	等待空闲()	
	mapNum = 取当前地图编号()
	local 当前地图名 = 取当前地图名()
	if(当前地图名 ==  "小岛")then goto island
	elseif(当前地图名 ==  "圣鸟之巢")then goto anhao	
	elseif(当前地图名 ==  "圣山之巅")then goto boss	
	elseif(mapNum ==  57180)then map57180()
	elseif(mapNum ==  57181)then map57181()
	elseif(mapNum ==  57185)then map57185()
	end		
	等待(3000)
	goto begin
::island::
	if(取当前地图名() ~= "小岛")then
		goto begin
	end		
	
	if(是否目标附近(79, 88))then
		if(取物品数量("暗号") > 0)then
			喊话("已拿到暗号",2,3,5)
		else
			对话选是(79, 88)
		end		
	end
	if(是否目标附近(55, 81))then	
		if(取物品数量("星鳗饭团") < 1)then
			对话选是(55, 81)	
		else			
			喊话("已拿到星鳗饭团",2,3,5)	
		end
	end	
	if(是否目标附近(59,78))then			
		if(取物品数量("匆忙写下的笔录") > 0)then
			日志("已拿到半山3任务物品",1)
			回城()
			return
		end		
		对话选是(59,78)			
		goto begin
	end	
	if(取队伍人数() < 2)then	
		common.joinTeam(队长名称)
	end		
	goto begin
::anhao::
	if(取当前地图名() ~= "圣鸟之巢")then
		goto begin
	end
	if(是否目标附近(14,11))then
		对话选是(14,11)
		喊话("我是来送鳗鱼饭的",2,3,5)
		等待服务器返回()
		对话选择(1,0)
		等待(2000)		
	end	
	goto begin
::boss::
	if(取当前地图名() ~= "圣山之巅")then
		goto begin
	end
	if(取队伍人数() < 2)then	
		common.joinTeam(队长名称)
	end	
	if(是否目标附近(23,22))then		
		对话选是(23,22)		
	end	
	if(是否战斗中())then
		等待战斗结束()
		if(取当前地图名() == "小岛")then
			日志("半山3任务完成")
			return
		end
	end
	goto begin
end
main()