★黑一脚本

common=require("common")

清除系统消息()
    	

补魔值 = tonumber(用户输入框("多少魔以下补魔", "350"))
补血值=tonumber(用户输入框("多少血以下补血", "430"))
宠补血值=tonumber(用户输入框( "宠多少血以下补血", "50"))
宠补魔值=tonumber(用户输入框( "宠多少魔以下补血", "100"))
队伍人数=tonumber(用户输入框("练级队伍人数，不足则固定点等待！",5))
走路加速值=115	--脚本走路中可以设定移动速度  到达目的地后，再还原值即可
走路还原值=100	--防止掉线 还原速度
卖店物品列表="魔石|卡片？|锹型虫的卡片|水晶怪的卡片|哥布林的卡片|红帽哥布林的卡片|迷你蝙蝠的卡片|绿色口臭鬼的卡片|锥形水晶"		--可以增加多个 不影响速度
设置队员列表=取脚本界面数据("队员列表")
队员列表={}
遇敌总次数=0
练级前经验=0
练级前时间=os.time() 
if(设置队员列表==nil or 设置队员列表=="")then
	设置队员列表 = 用户输入框("练级队员列表，不设置则不判断队员！","")
end
if(设置队员列表 ~= nil and string.find(设置队员列表,"|") ~= nil)then
	队员列表=common.luaStringSplit(设置队员列表,"|")
end

function 营地商店检测水晶(crystalName,equipsProtectValue,buyCount)
	if(equipsProtectValue==nil)then equipsProtectValue =100 end
	if(crystalName == nil)then crystalName="水火的水晶（5：5）" end
	if(buyCount==nil) then buyCount=1 end
	--检测水晶
	local itemList = 物品信息()
	local crystal = nil
	for i,item in ipairs(itemList)do
		if(item.pos == 7)then
			crystal = item
			break
		end
	end
	if(crystal~=nil and crystal.name == crystalName and crystal.durability > equipsProtectValue) then
		return
	end
	crystal=nil
	--需要更换 检查身上是否有备用水晶
	for i,item in ipairs(itemList)do
		if(item.name == crystalName and item.durability > equipsProtectValue)then
			crystal = item
			break
		end
	end

	if(crystal~=nil ) then
		交换物品(crystal.pos,7,-1)
		return
	end
	--买水晶
	local 当前地图名 = 取当前地图名()
	if(当前地图名 == "商店")then 
		自动寻路(14,26)
	elseif(当前地图名 == "圣骑士营地")then 
		自动寻路(92, 118,"商店")
		自动寻路(14,26)
	else
		return
	end
	转向(2)
	等待服务器返回()
	common.buyDstItem(crystalName,1)
	扔(7)--扔旧的
	等待(1000)	--等待刷新
	使用物品(crystalName)	
	自动寻路(0,14,"圣骑士营地")	
end
function 等待队伍人数达标(练级点)				--等待队友	
::begin::
	喊话(练级点 .."练级脚本，来打手人够脚本自动前往【"..练级点.."】++++",2,3,5)
	等待(5000)
	if(取当前地图名() ~= "医院")then
		return
	end
	if(队伍("人数") < 队伍人数) then	--数量不足 等待
		goto begin
	end	
	喊话("人数达标，自动前往【"..练级点.."】，请不要离开队伍,谢谢！",2,3,5)
	return 
end
function 营地存取金币(金额,存取)
	if(金额==nil) then return end
	local 当前地图名 = 取当前地图名()
	if(当前地图名 == "银行")then 
		自动寻路(27,23)
	elseif(当前地图名 == "圣骑士营地")then 
		自动寻路(116, 105,"银行")
		自动寻路(27,23)
	else
		return
	end
	转向(2)
	等待服务器返回()
	if(存取==nil or 存取=="存")then
		银行("存钱",金额)	
	else
		银行("取钱",金额)
	end
end
function 黑一练级(目标等级)  
	清除系统消息()
	设置个人简介("玩家称号",目标等级)
	练级前经验=人物("经验")
	练级前宠经验=宠物("经验")
	练级前金币=人物("金币")
	outMazeX=nil	--蜥蜴和黑一 练级时 记录迷宫坐标
	outMazeY=nil
	是否到达过龙顶=false
	水晶名称="水火的水晶（5：5）"
	
::begin::
	等待空闲()
	local 当前地图名 = 取当前地图名()
	local mapIndex = 取当前地图编号()
	local x,y=取当前坐标()		
	if (当前地图名 =="艾尔莎岛" )then goto quYingDi
	elseif (string.find(当前地图名,"黑龙沼泽")~= nil )then goto yudi
	elseif(当前地图名 ==  "里谢里雅堡")then goto quYingDi 
	elseif(当前地图名 ==  "法兰城")then goto quYingDi 
	elseif(当前地图名 == "医院")then goto StartBegin
	elseif(当前地图名 ==  "圣骑士营地")then goto quYiYuan
	elseif(当前地图名 ==  "商店")then goto yingDiShangDian
	elseif(当前地图名 ==  "银行" and mapIndex == 59548)then goto aiDaoBank
	elseif(当前地图名 ==  "银行" and mapIndex == 1121)then goto faLanBank
	elseif(当前地图名 ==  "银行" and mapIndex == 44698)then goto yingDiYinHang
	elseif(当前地图名 ==  "工房")then goto lu2
	elseif(当前地图名 ==  "肯吉罗岛")then goto kenDaoPanDuan end
	回城()
	等待(1000)
	goto begin
::faLanBank::
	自动寻路(11,8)
	面向("东")
	等待服务器返回()
	if(人物("金币") > 950000)then
		营地存取金币(-300000)		--留30万
	elseif(人物("金币") <50000)then
		营地存取金币(-300000,"取")	--取出后 身上总30万
	end
	回城()
	goto begin
::aiDaoBank::
	自动寻路(49,30)
	面向("东")
	等待服务器返回()
	if(人物("金币") > 950000)then
		营地存取金币(-300000)		--留30万
	elseif(人物("金币") <50000)then
		营地存取金币(-300000,"取")	--取出后 身上总30万
	end
	回城()
	goto begin
::yingDiShangDian::
	营地商店检测水晶()
	自动寻路(0,14,"圣骑士营地")	
	goto begin
::yingDiYinHang::
	if(人物("金币") > 950000)then
		营地存取金币(-300000)		--留30万
	elseif(人物("金币") <50000)then
		营地存取金币(-300000,"取")	--取出后 身上总30万
	end
	自动寻路(3,23,"圣骑士营地")	
	goto begin
::kenDaoPanDuan::
	if(目标是否可达(232,439) == false) then --营地这边岛 去黑龙
		goto lu4
	end
	--矮人这边 回营地去黑一		
	自动寻路(307, 362,"蜥蜴洞穴")
	自动寻路(12, 12)
	自动寻路(12, 13,"肯吉罗岛")
	等待(1000)
	等待空闲()
	goto lu4

::quYingDi::
	设置("移动速度",走路加速值)
	common.checkHealth()
	common.checkCrystal(水晶名称)
	common.supplyCastle()
	common.sellCastle()		
	common.去营地()
	设置("移动速度",走路还原值)
	goto begin
::StartBegin::
	喊话("脚本启动等待",06,0,0)
	等待(1000)
	自动寻路(9,15)
	if(取当前地图名() ~= "医院")then
		goto begin
	end
	if(队伍("人数") < 队伍人数)then	--数量不足 等待
		common.makeTeam(队伍人数,队员列表)
	else
		喊话("美特斯邦威  飞一般滴感觉",06,0,0)	
		goto xue	
	end	
	goto StartBegin
::lu1::
    等待到指定地图("圣骑士营地",95,72)
::lu1a::   
	自动寻路( 87, 72)      
	goto lu2 
::lu2::
	--等待到指定地图("工房",30,37)
	等待到指定地图("工房")
	自动寻路(21,22)
	自动寻路(20,22)
	自动寻路(20,24)
	自动寻路(21,24)      
	等待(2000)
	goto sale 

::sale::      
	卖(0, 卖店物品列表)	
	等待(15000)
	goto lu3 
::lu3::      
	等待到指定地图("工房",21,24)    
	自动寻路( 30, 37)
	等待到指定地图("圣骑士营地",87,72)    
	自动寻路( 80, 87)
	营地商店检测水晶()
	if(人物("金币") > 950000)then
		营地存取金币(-300000)		--留30万
	elseif(人物("金币") <50000)then
		营地存取金币(-300000,"取")	--取出后 身上总30万
	end
	if(取当前地图名() == "商店")then
		自动寻路(0,14,"圣骑士营地")	
	elseif(取当前地图名() == "银行")then
		自动寻路(3,23,"圣骑士营地")	
	end
	自动寻路(36,87)      
	goto lu4 
::lu4::
	等待到指定地图("肯吉罗岛")	  
	自动寻路(424, 344)        
	自动寻路(424, 345)
	等待(1000)
	等待空闲() 	
::yudi::
	if(string.find(当前地图名,"黑龙沼泽")== nil )then
		goto begin
	end
	--增加一层判断 防止重启脚本一直循环死
	if(人物("血") < 补血值)then goto  ting end
	if(人物("魔") < 补魔值)then goto  ting end
	if(宠物("血") < 宠补血值)then goto  ting end
	if(宠物("魔") < 宠补魔值)then goto  ting end	
	if( (人物("健康") > 0 or 人物("灵魂") > 0)  and 是否空闲中())then
		回城()
		goto begin
	end
	if(取队伍人数() < 3)then			--队友掉线-人数太少 登出回城 
		脚本日志("队友掉线，回补！")
		goto ting		
	end
::dstFloor::
	while true do 
		当前地图名=取当前地图名()		
		if(string.find(当前地图名,"黑龙沼泽")== nil )then goto begin end	--不是黑龙沼泽 退回
		if(当前地图名 == "黑龙沼泽")then			
			移动到目标附近(11,17,1)	
			自动寻路(11,17)
			等待(2000)
			等待空闲()
			if(取当前地图名()== "黑龙沼泽")then	--还是黑龙沼泽 说明迷宫刷新 稍等会
				goto dstFloor
			end
			break	
		end
		if(队伍("人数")<2)then		--爬楼中途 增加人数判断
			回城()
			goto begin
		end
		自动迷宫(1)
	end
	outMazeX,outMazeY = 取当前坐标()	
	curx,cury = 取当前坐标()
	tgtx,tgty = 取周围空地(curx,cury,1)--取当前坐标3格范围内 空地
	自动寻路(tgtx,tgty)
	等待(1000)
	开始遇敌()                 
::scriptstart::
	if(人物("血") < 补血值)then goto  ting end
	if(人物("魔") < 补魔值)then goto  ting end
	if(宠物("血") < 宠补血值)then goto  ting end
	if(宠物("魔") < 宠补魔值)then goto  ting end	
	if(string.find(当前地图名,"黑龙沼泽")== nil)then	goto begin end
	if(string.find(最新系统消息(),"被不可思议的力量送出了")~=nil)then goto  ting2	end	
	if(string.find(最新系统消息(),"你感觉到一股不可思议的力量")~=nil)then goto  ting3	end	
	if 是否战斗中() then
		遇敌总次数=遇敌总次数+1
		等待战斗结束()
	end		
	if( (人物("健康") > 0 or 人物("灵魂") > 0)  and 是否空闲中())then
		回城()
		goto begin
	end
	if(取队伍人数() < 3)then			--队友掉线-人数太少 登出回城 
		脚本日志("队友掉线，回补！")
		goto ting		
	end
	等待(2000)
	goto scriptstart  
::ting2::	
	停止遇敌()	
	清除系统消息()	
	goto lu4 
::ting3::
	停止遇敌()	
	清除系统消息()
	自动寻路(outMazeX,outMazeY)
	等待(3000)		--这个是等指定时间
	等待空闲()		--这个是等待切图或战斗  状态是正常后，才会退出当前等待
	if(取当前地图名() == "黑龙沼泽")then
		日志("呼哈，等待迷宫刷新",1)
		等待(170000)		--等待迷宫刷新
		goto dstFloor
	end
	goto begin		--不知道在哪 就begin吧
::ting::
	停止遇敌()      
	等待空闲() 	
	喊话("共遇敌次数"..遇敌总次数,2,3,5)
	common.statistics(练级前时间,练级前经验,练级前宠经验,练级前金币)	--统计脚本效率
	回城()
	等待(2000)
	goto begin
::quYiYuan::
	自动寻路( 94, 72)
	自动寻路( 95, 72)
	goto lu6 
::lu6::
	等待到指定地图("医院", 0, 20)     
	goto begin
::xue::
	自动寻路(14,20)
	自动寻路(18,16)
	自动寻路(18,15)
	自动寻路(17,15)
	自动寻路(19,15)
	自动寻路(18,15)     
	回复(0)			-- 转向北边恢复人宠血魔      
	等待(15000)                   --等待X秒等候队友反应 
	if(宠物("健康") > 0) then	
		自动寻路(6,7)
		自动寻路(8,7)
		自动寻路(6,7)
		转向坐标(7,6)
		等待服务器返回()
		对话选择(-1,6)		
	end
	自动寻路(1,20)   
    自动寻路(0,20)      
    goto lu1 
::goEnd::
	return
end

黑一练级(115)  	
