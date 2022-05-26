1-160全自动练级

common=require("common")

local 补血值=取脚本界面数据("人补血")
local 补魔值=取脚本界面数据("人补魔")
local 宠补血值=取脚本界面数据("宠补血")
local 宠补魔值=取脚本界面数据("宠补魔")
local 队伍人数=取脚本界面数据("队伍人数")
local 设置队员列表=取脚本界面数据("队员列表")
local 队员列表={}
local 是否练宠=取脚本界面数据("是否练宠")
if(补血值==nil or 补血值==0)then
	补血值=用户输入框("多少血以下补血", "430")
else
	补血值=tonumber(补血值)
end
if(补魔值==nil or 补魔值==0)then
	补魔值 = 用户输入框("多少魔以下补魔", "200")
else
	补魔值=tonumber(补魔值)
end
if(宠补血值==nil or 宠补血值==0)then
	宠补血值 = 用户输入框( "宠多少血以下补血", "50")
else
	宠补血值=tonumber(宠补血值)
end
if(宠补魔值==nil or 宠补魔值==0)then
	宠补魔值=用户输入框( "宠多少魔以下补魔", "50")
else
	宠补魔值=tonumber(宠补魔值)
end
if(队伍人数==nil or 队伍人数==0)then
	队伍人数 = 用户输入框("练级队伍人数，不足则固定点等待！",5)
else
	队伍人数=tonumber(队伍人数)
end
if(设置队员列表==nil or 设置队员列表=="")then
	设置队员列表 = 用户输入框("练级队员列表，不设置则不判断队员！","")
end
if(设置队员列表 ~= nil and string.find(设置队员列表,"|") ~= nil)then
	队员列表=common.luaStringSplit(设置队员列表,"|")
end
if(是否练宠==nil or 是否练宠 ==0)then
	是否练宠 = 用户输入框("是否练宠,是1，否0",0)
else
	是否练宠=tonumber(是否练宠)
end
local 是否卖石=用户输入框("是否卖魔石,是1，否0",1)
local 走路加速值=110	--脚本走路中可以设定移动速度  到达目的地后，再还原值即可
local 走路还原值=100	--防止掉线 还原速度
local 身上最少金币=100000	--10w
local 多少金币去拿钱=10000	--1w

local 卖店物品列表="魔石|卡片？|锹型虫的卡片|狮鹫兽的卡片|水蜘蛛的卡片|虎头蜂的卡片|水晶怪的卡片|哥布林的卡片|红帽哥布林的卡片|迷你蝙蝠的卡片|绿色口臭鬼的卡片|锥形水晶"		--可以增加多个 不影响速度
local 医生名称={"星落护士","谢谢惠顾☆"}
local 遇敌总次数=0
local 练级前经验=0
local 练级前时间=os.time() 
local 半山西门=true	--半山是西门还是里堡二楼
local 是否自动购买水晶=false

local 扔物品列表={'时间的碎片','时间的结晶','绿头盔','红头盔','秘文之皮','星之砂','奇香木','巨石','龙角','坚硬的鳞片','传说的鹿皮','碎石头'}
设置("自动叠",1, "时间的结晶&20")	
设置("自动叠",1, "时间的碎片&20")	
for i,v in pairs(扔物品列表) do
	设置("自动扔",1, v)	
end


--不踢人 踢人可以用common接口
function 等待队伍人数达标(练级点)				--等待队友	
::begin::
	喊话(练级点 .."练级脚本，来打手人够脚本自动前往【"..练级点.."】++++",2,3,5)
	等待(5000)
	if(队伍("人数") < 队伍人数) then	--数量不足 等待
		goto begin
	end	
	喊话("人数达标，自动前往【"..练级点.."】，请不要离开队伍,谢谢！",2,3,5)
	return 
end

function 洞窟练级()	
	日志("洞窟练级",1)	
	清除系统消息()
	练级前经验=人物("经验")
	练级前宠经验=宠物("经验")
	练级前金币=人物("金币")
	水晶名称="地水的水晶（5：5）"
	common.checkHealth(医生名称)
	if(是否自动购买水晶)then
		common.checkCrystal(水晶名称)	
	end
::begin::	
	等待空闲()
	local 当前地图名 = 取当前地图名()
	local x,y=取当前坐标()	
	mapNum=取当前地图编号()
	if (当前地图名=="艾尔莎岛" )then	
		goto erDao	
	elseif (mapNum==59539 )then	
		goto erYiYuan
	elseif (当前地图名=="冒险者旅馆" )then	
		goto sale
	elseif (当前地图名=="盖雷布伦森林" )then	
		goto toGaoDi
	elseif (当前地图名=="布拉基姆高地" )then	
		goto lu4
	elseif (当前地图名=="艾夏岛" )then	
		goto aiXiaDao
	end
	回城()
	等待(1000)
	goto begin
::aiXiaDao::					--去医院
	移动(112, 81)	
	goto erYiYuan
::erDao::
	移动(158, 94)	
	转向(0)
	等待到指定地图("艾夏岛")
	移动(112, 81)	
::erYiYuan::
	等待到指定地图("医院")	
	移动(34, 46)
	移动(35, 46)
	移动(35, 47)
	移动(35, 45)
	移动(35, 47)
	回复(1)  
	等待(8000)
	移动(28, 47)
	if(队伍("人数") < 队伍人数)then	--数量不足 等待
		等待队伍人数达标("洞窟")
	end
	
	移动(28, 52)	
	等待到指定地图("艾夏岛")	
::start_1::
	移动(190, 116)	
::toGaoDi::
	等待到指定地图("盖雷布伦森林")	
	移动(231, 222)	
	等待到指定地图("布拉基姆高地")		
	移动(227, 165)
    goto lu4 
::StartBegin::	
	等待到指定地图("洞窟之村　第２层", 148, 170)	
	移动( 52, 145)
	goto lu1 
::lu1::
	等待到指定地图("洞窟之村　第１层")
	移动( 97, 76)
	goto lu4 
::lu4::
	等待到指定地图("布拉基姆高地")	
	等待(1000)	
	移动(230,165) 	     
	移动(230,166) 
	等待(1000)      
	开始遇敌()  
  	goto yudi         
::yudi::	
	if(人物("血") < 补血值) then goto  ting end
	if(人物("魔") < 补魔值) then goto  ting end
	if(宠物("血") < 宠补血值) then goto  ting end
	if(宠物("魔") < 宠补魔值) then goto  ting end
	
	if 是否战斗中() then
		遇敌总次数=遇敌总次数+1
		等待战斗结束()
	end		
	if(取队伍人数() ~= 队伍人数)then	--掉线 回城
		脚本日志("队友掉线，回城！")
		goto  ting		
	end
	等待(1000)	
	goto yudi  
	
::ting::	
	停止遇敌()                 -- 结束战斗
	等待到指定地图("布拉基姆高地")
	喊话("共遇敌次数"..遇敌总次数,2,3,5)
	common.statistics(练级前时间,练级前经验)	--统计脚本效率

	if(取队伍人数() ~= 队伍人数)then	--掉线 回城
		脚本日志("队友掉线，回城！")
		回城()
		goto begin
	end
	移动(230,165)
	移动(231,165)       
	等待到指定地图("洞窟之村　第１层")	
	移动(203,98)	
	移动(203,100)
	goto lu6 

::lu6::
	等待到指定地图("洞窟之村　第２层", 52, 145)
	移动(142,163)
	移动(142,170)
	移动(148,170)
	移动(148,169)
	移动(148,171)
	移动(148,170)      
    goto xue 
::xue::
    回复(2)			-- 转向北边恢复人宠血魔      
    等待(16000)                   --等待X秒等候队友反应
    goto StartBegin 
::sale::	--卖石	
	等待到指定地图("冒险者旅馆")	
	移动(37,30)
	移动(38,30)
	移动(37,30)
	移动(38,30)
	移动(37,30)
	卖(37,29,卖店物品列表)	
	等待(3000)
	移动(38, 48)
	goto begin
end

洞窟练级()
