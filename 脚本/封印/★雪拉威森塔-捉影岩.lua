★起点新城

common=require("common")

设置("timer",0)
local 补魔值=用户输入框( "多少魔以下去补给", "400")
local 补血值=用户输入框( "多少血以下去补给", "400")
local 宠补魔值=用户输入框( "宠多少魔以下去补给", "200")
local 宠补血值=用户输入框( "宠多少血以下去补给", "200")
local 卖店物品列表="魔石|卡片？|锹型虫的卡片|水晶怪的卡片|哥布林的卡片|红帽哥布林的卡片|迷你蝙蝠的卡片|绿色口臭鬼的卡片|锥形水晶"	
local cardName = "封印卡（金属系）"
cardCount=60		--一次买多少
设置("自动叠",1,cardName.."&20")
local mapName=""
local mapNum=0

清除系统消息()
function main()
::begin::  
	--等待空闲()
	mapName=取当前地图名()
	mapNum=取当前地图编号()
	if (人物("宠物数量") >= 5 )then	
		日志("宠物满了，去银行存货！")
		common.depositNoBattlePetToBank()
		if (人物("宠物数量") >= 5 )then	
			日志("银行宠物也满啦！请先清理，再重新执行脚本！")
			return
		end
	end
	if(mapName=="艾尔莎岛")then	goto aiersha	
	elseif (mapName=="利夏岛" )then	goto map59522
	elseif (mapName=="国民会馆" )then goto map59552	
	elseif (mapName=="克罗利的店")then goto outshop 
	elseif (mapName=="雪拉威森塔１层" )then goto map59801
	elseif (mapName=="雪拉威森塔４０层" )then goto map59840
	elseif (mapName=="雪拉威森塔３９层" )then goto map59839
	end
	common.supplyCastle()
	common.sellCastle()		--默认卖
	common.checkHealth()
	common.checkCrystal(水晶名称)	
	回城()
	goto begin 
::aiersha::	
	if(取物品叠加数量(cardName) < cardCount) then
		goto maika
	end
	common.checkHealth()
	自动寻路(165, 153)
	转向(4)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(4, 0)		
	等待(1000)
::map59522::					--利夏岛
	if(取当前地图名() ~= "利夏岛")then
		goto begin
	end
	自动寻路(90,99,"国民会馆")
::map59552::					--国民会馆
	自动寻路(109,51)
	回复(108,52)	
	自动寻路(108,39,"雪拉威森塔１层")
	goto begin
::map59801::					--雪拉威森塔１层
	自动寻路(72, 56,"雪拉威森塔４０层")		
	--自动寻路(20, 44,"雪拉威森塔８５层")
	--自动寻路(18, 44,"雪拉威森塔９０层")	
	--自动寻路(16, 44,"雪拉威森塔９５层")
	goto begin
::map59885::
	自动寻路(57,132)
	goto loop
::map59890::
	自动寻路(61,41)
	goto loop
::map59895::
  	自动寻路(101, 46)
	goto loop
::map59840::
	自动寻路(96, 83,"雪拉威森塔３９层")	
	goto begin
::map59839::
	自动寻路(282, 186)
	goto loop
	
::loop::	
	开始遇敌()         
::scriptstart::
	if(人物("血") < 补血值)then goto  ting end
	if(人物("魔") < 补魔值)then goto  ting end
	if(宠物("血") < 宠补血值)then goto  ting end
	if(宠物("魔") < 宠补魔值)then goto  ting end
	if(取物品叠加数量(cardName) < 1)then goto  ting end
	if (人物("宠物数量") >= 5 )then	
		日志("宠物数量满了，回城存储！")
		goto ting	
	end
	等待(2000)
	goto scriptstart  	
::ting::
	停止遇敌()
	回城()     
	goto begin 

::maika::
	自动寻路(144,105)
	自动寻路(157,93)
	转向(2)	
	等待到指定地图("艾夏岛", 1)	
	转向(6)
	等待到指定地图("艾夏岛", 164,159)	
	转向(7)
	等待到指定地图("艾夏岛", 151,97)	
	自动寻路(150, 125,"克罗利的店")
::shop::
	自动寻路(40,23)
	转向(2)
	等待服务器返回()
	nowCount = cardCount-取物品叠加数量(cardName)
	common.buyDstItem(cardName,nowCount)	
::outshop::
	if(取物品叠加数量(cardName) < cardCount) then
		goto shop
	end
	回城()
	goto begin
end 

main()