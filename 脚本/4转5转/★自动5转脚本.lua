★刷5转碎片脚本，加入自动组队功能

common=require("common")

清除系统消息()
    	

补血值=取脚本界面数据("人补血")
补魔值=取脚本界面数据("人补魔")
宠补血值=取脚本界面数据("宠补血")
宠补魔值=取脚本界面数据("宠补魔")
队伍人数=取脚本界面数据("队伍人数")
if(补血值==nil or 补血值==0)then
	补血值=用户输入框("多少血以下补血", "430")
end
if(补魔值==nil or 补魔值==0)then
	补魔值 = 用户输入框("多少魔以下补魔", "200")
end
if(宠补血值==nil or 宠补血值==0)then
	宠补血值 = 用户输入框( "宠多少血以下补血", "50")
end
if(宠补魔值==nil or 宠补魔值==0)then
	宠补魔值=用户输入框( "宠多少魔以下补魔", "50")
end
if(队伍人数==nil or 队伍人数==0)then
	队伍人数 = 用户输入框("练级队伍人数，不足则固定点等待！",5)
end
走路加速值=125	--脚本走路中可以设定移动速度  到达目的地后，再还原值即可
走路还原值=100	--防止掉线 还原速度
卖店物品列表="魔石|卡片？|锹型虫的卡片|水晶怪的卡片|哥布林的卡片|红帽哥布林的卡片|迷你蝙蝠的卡片|绿色口臭鬼的卡片|锥形水晶"		--可以增加多个 不影响速度

遇敌总次数=0
练级前经验=0
练级前时间=os.time() 
五转洞名称="隐秘之洞地下1层"
当前刷碎片属性=nil		--地水火风
默认刷碎片属性="风"		--地水火风
刷碎片数量=用户输入框("刷碎片数量","20")
是否卖石=false	
是否自动5转=true
--先检查自己的碎片 如果没满20  就先刷某一个，全满继续下一个
--自己检查完,都满足后，检查队友的
--地水火风
function checkElement()
	local elementList={"地","水","火","风"}
	for i,tmpEle in ipairs(elementList) do
		if(取物品叠加数量("隐秘的徽记（"..tmpEle.."）") < 刷碎片数量) then
			return tmpEle
		end
	end
	return nil
end

--获取队友需刷的碎片名称
function getTeammateElementName(name)
	local card = 取好友名片(name)
	if( card == nil)then
		return nil		
	end	
	local elementList={"地","水","火","风"}
	for i,tmpEle in ipairs(elementList) do
		if(string.find(card.title,tmpEle.."缺") ~= nil) then
			return tmpEle
		end
	end
	return nil
end

function checkTeammateNeedElement()
	local teamPlayers = 队伍信息()
	for index,teamPlayer in ipairs(teamPlayers) do
		local tmpEle = getTeammateElementName(teamPlayer.name)
		if(tmpEle ~= nil)then
			return tmpEle
		end
	end	
	return nil
end

--检查队长身上物品，去指定洞
function checkBagChip()
	local elementList={"风","水","火","地"}
	for i,tmpEle in ipairs(elementList) do
		if(取物品数量("隐秘的水晶（"..tmpEle.."）") > 0) then
			当前刷碎片属性=tmpEle
			return
		end
	end

	日志("水晶错误，请检查身上物品",1)
	return nil
end

function checkChangeMap()
	local selfEle = checkElement()		
	if(selfEle ~= nil) then
		当前刷碎片属性=selfEle
		日志("当前队长缺少【"..当前刷碎片属性.."】碎片，去刷【"..当前刷碎片属性.."】洞",1)
		return 
	end	
	if(selfEle == nil) then	
		--检查队友
		local teamPlayers = 队伍信息()
		for index,teamPlayer in ipairs(teamPlayers) do
			local tmpEle = getTeammateElementName(teamPlayer.name)
			if(tmpEle ~= nil)then
				当前刷碎片属性=tmpEle
				日志("当前队长碎片已满，队友【"..teamPlayer.name.."】缺少【"..当前刷碎片属性.."】碎片，去刷【"..当前刷碎片属性.."】洞",1)
				return
			end
		end		
	end	
	--都没有 默认刷风？
	--当前刷碎片属性=默认刷碎片属性
end

function findHoleEntry(mazeName)
	if(取当前地图名() ~= "肯吉罗岛")then
		return false
	end
	local targetEntryArr  ={
	["地"] = {{498,273},{498,253},{498,233},{505,223},{515,233},{515,253},{515,273},{508,290},{515,293},{532,273},{532,263},{532,253},{532,243},{540,253},{549,256},{549,273},{549,293},{561,293},{566,298},{497,294}},
    ["水"] = {{346,492},{354,514},{346,522},{340,513}},
    ["火"] = {{432,427},{428,429},{442,415},{452,405}},
    ["风"] = {{401,207},{395,223}},
    ["黑一"] = {{424, 344},{424, 345}}
     }	--地103013 model_id
	local modelID=103013
	if(maze == "地")then
		modelID=103013
	else
		modelID=nil
	end
	local findMazeList=targetEntryArr[mazeName]
	for index,pos in ipairs(findMazeList) do						
		移动(pos[1],pos[2])	
		if(common.findAroundMazeEx(五转洞名称,modelID) == true)then
			return true
		end
	end
	return false
end

--自动五转任务
function 五转任务()
	清除系统消息()
	练级前经验=人物("经验")
	练级前宠经验=宠物("经验")
	练级前金币=人物("金币")
	outMazeX=nil	--蜥蜴和黑一 练级时 记录迷宫坐标
	outMazeY=nil	
	水晶名称="水火的水晶（5：5）"
	if(当前刷碎片属性=="地")then
		水晶名称="风地的水晶（5：5）"
	elseif(当前刷碎片属性=="水")then
		水晶名称="风地的水晶（5：5）"	
	elseif(当前刷碎片属性=="火")then
		水晶名称="水火的水晶（5：5）"	
	elseif(当前刷碎片属性=="风")then
		水晶名称="水火的水晶（5：5）"
	end
	
::begin::
	等待空闲()
	local 当前地图名 = 取当前地图名()
	local x,y=取当前坐标()		
	if (当前地图名 =="艾尔莎岛" )then goto quYingDi
	elseif (string.find(当前地图名,"隐秘之洞")~= nil )then goto yudi
	elseif(当前地图名 ==  "里谢里雅堡")then goto quYingDi 
	elseif(当前地图名 ==  "法兰城")then goto quYingDi 
	elseif(当前地图名 == "医院")then goto StartBegin
	elseif(当前地图名 ==  "圣骑士营地")then goto quYiYuan
	elseif(当前地图名 ==  "商店")then goto yingDiShangDian
	elseif(当前地图名 ==  "银行")then goto yingDiYinHang
	elseif(当前地图名 ==  "工房")then goto lu2
	elseif(当前地图名 ==  "隐秘之洞地下1层")then goto yudi	
	elseif(当前地图名 ==  "未来之塔入口第1层")then goto outMaze	
	elseif(当前地图名 ==  "肯吉罗岛")then goto kenDaoPanDuan end
	回城()
	等待(1000)
	goto begin
::outMaze::
	curx,cury = 取当前坐标()
	tx,ty=取周围空地(curx,cury,1)--取当前坐标指定距离范围内 空地
	移动(tx,ty)
	移动(curx,cury)		
	等待空闲()
	goto begin
::yingDiShangDian::
	营地商店检测水晶()
	移动(0,14,"圣骑士营地")	
	goto begin
::yingDiYinHang::
	if(人物("金币") > 950000)then
		common.gotoBankTalkNpc()
		银行("存钱",-300000)		
	elseif(人物("金币") <50000)then
		common.gotoBankTalkNpc()
		银行("取钱",-300000)	
	end
	移动(3,23,"圣骑士营地")	
	goto begin
::kenDaoPanDuan::
	if(目标是否可达(232,439) == false) then --营地这边岛 去黑龙
		goto lu4
	end
	--矮人这边 回营地去黑一		
	移动(307, 362,"蜥蜴洞穴")
	移动(12, 12)
	移动(12, 13,"肯吉罗岛")
	等待(1000)
	等待空闲()
	goto lu4

::quYingDi::
	设置("移动速度",走路加速值)
	common.checkHealth()
	common.checkCrystal(水晶名称)
	common.supplyCastle()
	common.去营地()
	设置("移动速度",走路还原值)
	goto begin
::StartBegin::		--医院
	喊话("脚本启动等待",06,0,0)
	等待(1000)
	移动(9,15)
	if(取当前地图名() ~= "医院")then
		goto begin
	end
	if(队伍("人数") < 队伍人数)then	--数量不足 等待
		common.makeTeam(队伍人数)	
	end
	当前刷碎片属性=nil --归位 
	checkBagChip()
	if(当前刷碎片属性 == nil)then
		if(是否自动5转)then
			日志("碎片刷满了，开始自动5转",1)
			当前刷碎片属性="五转"
		else
			日志("碎片刷满了，脚本退出",1)
			当前刷碎片属性="黑一"
		end
	end
	喊话("美特斯邦威  飞一般滴感觉",06,0,0)	
	goto xue	
::lu1::
    等待到指定地图("圣骑士营地",95,72)
	if(是否卖石 ==0)then
		goto toland
	end
::lu1a::   
	移动( 87, 72,"工房")      
	goto lu2 
::lu2::
	--等待到指定地图("工房",30,37)
	等待到指定地图("工房")
	移动(21,22)
	移动(20,22)
	移动(20,24)
	移动(21,24)      
	等待(2000)
	goto sale 

::sale::      
	卖(0, 卖店物品列表)	
	等待(15000)
	goto lu3 
::lu3::      
	等待到指定地图("工房",21,24)    
	移动( 30, 37)
	等待到指定地图("圣骑士营地",87,72)    
::toland::
	移动(80, 87)
	移动(36,87)      
	goto lu4 
::lu4::
	等待到指定地图("肯吉罗岛")	 
	--重新检查刷哪个洞
	checkBagChip()			
	findHoleEntry(当前刷碎片属性)
	等待(1000)
	等待空闲() 	
::yudi::
	if(取当前地图名() ~= "隐秘之洞地下1层")then
		日志("没有找到洞穴，请手动查看问题",1)
		goto begin
	end
::穿越迷宫::
	当前地图名 = 取当前地图名()
	if(string.find(当前地图名,"隐秘之洞") == nil) then
		if(string.find(最新系统消息(),"被不可思议的力量送出了")~=nil)then 
			goto ting2	
		end	
		goto begin	
	end
	if(当前地图名 == "隐秘之洞 地下10层")then
		使用物品("隐秘的水晶（"..当前刷碎片属性.."）")
		等待(3000)
		curx,cury = 取当前坐标()
		tgtx,tgty = 取周围空地(curx,cury,1)--取当前坐标1格范围内 空地
		移动(tgtx,tgty)
		common.makeTeam(队伍人数)
		if(队伍("人数")==队伍人数)then
			自动迷宫(1,"",0)			
		end
	end		
	if(当前地图名 == "隐秘之洞 最底层")then
		--战斗
		battleBoss()
		--对话完毕，登出
	end
	if(取队伍人数() ~=  队伍人数)then			--队友掉线-人数太少 登出回城 
		if(取当前地图名() ~= "隐秘之洞 最底层" and 取当前地图名() ~= "隐秘之洞 地下10层")then	
			日志(取当前地图名().."-队友掉线，登出重来！",1)
			goto ting		
		end		
	end
	自动迷宫(1)
	等待(1000)
	goto 穿越迷宫     

 
::ting2::	
	停止遇敌()	
	清除系统消息()	
	日志("迷宫刷新，回城检测受伤，重新来！",1)
	回城()
	goto lu4 
::ting::
	停止遇敌()      
	等待空闲() 	
	喊话("共遇敌次数"..遇敌总次数,2,3,5)
	common.statistics(练级前时间,练级前经验,练级前宠经验,练级前金币)	--统计脚本效率
::maze::	
	if(outMazeX == nil or outMazeY==nil) then	
		if (string.find(当前地图名,"隐秘之洞")== nil )then goto begin end	--不是黑龙沼泽 退回
		自动迷宫(1,"",0)	--1下载地图 过滤点 0取近距离出口/1远距离出口
		等待空闲()
		if(取当前地图名() == "隐秘之洞地下2层") then	--反了
			local curx,cury = 取当前坐标()
			local tx,ty=取周围空地(curx,cury,1)--取当前坐标指定距离范围内 空地
			移动(tx,ty)
			移动(curx,cury)			
			等待空闲() 	
			if(取当前地图名() == "隐秘之洞地下1层") then	
				自动迷宫(1,"",1)	
				等待空闲() 	
			end
		end
	else
		移动(outMazeX,outMazeY)
	end	
	等待空闲() 	
	if(取当前地图名() == "肯吉罗岛")then
		移动(551, 332,"圣骑士营地")	
		goto quYiYuan
	elseif(取当前地图名() ~= "隐秘之洞地下1层" and 取当前地图名() ~= "隐秘之洞地下2层") then	
		--不知道在哪 登出回城
		回城()
	else	--卡位 回城
		回城()
	end
	goto begin
::quYiYuan::
	if(取物品数量("洛伊夫的护身符") < 1)then
		移动( 99, 84)
		对话选是(100,84)
	end
	if(取物品数量("隐秘的水晶（风）") < 1 and 取物品数量("净化的烈风碎片") < 1)then
		移动( 99, 84)
		对话选是(100,84)
	end
	if(取物品数量("隐秘的水晶（水）") < 1 and 取物品数量("净化的流水碎片") < 1 )then
		移动( 99, 84)
		对话选是(100,84)
	end
	if(取物品数量("隐秘的水晶（火）") < 1 and 取物品数量("净化的火焰碎片") < 1)then
		移动( 99, 84)
		对话选是(100,84)
	end
	if(取物品数量("隐秘的水晶（地）") < 1 and 取物品数量("净化的大地碎片") < 1)then
		移动( 99, 84)
		对话选是(100,84)
	end
	移动( 94, 72)
	移动( 95, 72)
	goto lu6 
::lu6::
	等待到指定地图("医院", 0, 20)     
	goto begin
::xue::
	移动(14,20)
	移动(18,16)
	移动(18,15)
	移动(17,15)
	移动(19,15)
	移动(18,15)     
	回复(0)			-- 转向北边恢复人宠血魔      
	等待(15000)                   --等待X秒等候队友反应 
	if(宠物("健康") > 0) then	
		移动(6,7)
		移动(8,7)
		移动(6,7)
		转向坐标(7,6)
		等待服务器返回()
		对话选择(-1,6)		
	end
	移动(1,20)   
    移动(0,20)      
    goto lu1 
::goEnd::
	return
end

function battleBoss()
	
	local battleCount=0			--对战次数
::begin::
	if(取当前地图名()~= "隐秘之洞 最底层")then
		return 0
	end
	mapNum=取当前地图编号()
	if(mapNum == 27313 || mapNum == 27314)then		--风
		移动(24,19)
		对话选是(4)
	elseif(mapNum == 27307 || mapNum == 27308)then	--水
		移动(24,29)
		对话选是(0)
	elseif(mapNum == 27310 || mapNum == 27311)then	--火
		移动(29,24)
		对话选是(6)
	elseif(mapNum == 27304 || mapNum == 27305)then	--地
		移动(20,24)
		对话选是(2)
	elseif(mapNum == 27315)then		--隐秘之洞 最底层  5转
		移动(23,25)
		对话选是(24,24)
		return 1
	elseif(是否战斗中())then
		battleCount=battleCount+1
		等待战斗结束()
		goto checkBattleRes
	end
	等待(2000)
	goto begin
::checkBattleRes::	--检查对战结果
	if(battleCount < 1)then
		goto begin
	end
	if(取当前地图名()~= "隐秘之洞 最底层")then
		return 0
	end
	mapNum=取当前地图编号()
	if( mapNum == 27314)then		--风
		移动(24,19)
		对话选是(4)
	elseif( mapNum == 27308)then	--水
		移动(24,29)
		对话选是(0)
	elseif( mapNum == 27311)then	--火
		移动(29,24)
		对话选是(6)
	elseif( mapNum == 27305)then	--地
		移动(20,24)
		对话选是(2)
	elseif(mapNum == 27315)then		--隐秘之洞 最底层  5转
		移动(23,25)
		对话选是(24,24)
		return 1
	else
		日志("对战boss失败，请手动查看boss",1)
	end
	goto checkBattleRes
end
检查
五转任务()  	

