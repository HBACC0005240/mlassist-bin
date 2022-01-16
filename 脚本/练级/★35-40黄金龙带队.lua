★高地杀黄金龙多练脚本带队。医院35,47起点，高地"31,191"，


common=require("common")

补魔值 = 用户输入框("多少魔以下补魔", "50")
补血值=用户输入框("多少血以下补血", "430")
宠补血值=用户输入框( "宠多少血以下补血", "50")
宠补魔值=用户输入框( "宠多少魔以下补血", "100")
队伍人数=取脚本界面数据("队伍人数")
if(队伍人数==nil or 队伍人数==0)then
	队伍人数 = 用户输入框("练级队伍人数，不足则固定点等待！",5)
end
-- 设定自动及保护设置
--set(auto_protect, AutoMove, 1)                         -- 自动遇敌
--set(auto_protect, AutoMoveType, 4)                     -- 0:园圈自动遇敌，1东西行走，2南北行走，3随机行走4原地     
医生名称={"星落护士","谢谢惠顾☆"}
遇敌总次数=0
练级前经验=0
练级前时间=os.time() 
卖店物品列表="魔石|卡片？|锹型虫的卡片|狮鹫兽的卡片|水蜘蛛的卡片|虎头蜂的卡片|水晶怪的卡片|哥布林的卡片|红帽哥布林的卡片|迷你蝙蝠的卡片|绿色口臭鬼的卡片|锥形水晶"		--可以增加多个 不影响速度


走路加速值=125	--脚本走路中可以设定移动速度  到达目的地后，再还原值即可
走路还原值=100	--防止掉线 还原速度
是否卖石=用户输入框("是否卖魔石,是1，否0",1)

function 布拉基姆高地练级(目标等级,练级坐标x,练级坐标y,练级地名称)
	日志("布拉基姆高地练级-"..练级地名称,1)
	设置个人简介("玩家称号",目标等级)
	清除系统消息()
	练级前经验=人物("经验")
	练级前宠经验=宠物("经验")
	练级前金币=人物("金币")
	水晶名称="火风的水晶（5：5）"
	common.checkHealth(医生名称)
	common.checkCrystal(水晶名称)	
::begin::						--开始
	等待空闲()
	local 当前地图名 = 取当前地图名()
	local x,y=取当前坐标()	
	if (当前地图名=="艾尔莎岛" )then	
		goto erDao	
	elseif(取当前地图编号() == 1112)then
		回城()
		goto begin
	elseif (当前地图名=="医院" )then	
		goto erYiYuan
	elseif (当前地图名=="冒险者旅馆" )then	
		goto sale
	elseif (当前地图名=="盖雷布伦森林" )then	
		goto toGaoDi
	elseif (当前地图名=="布拉基姆高地" )then	
		goto toUpgradePos
	elseif (当前地图名=="艾夏岛" )then	
		goto aiXiaDao
	end
	回城()
	等待(1000)
	goto begin
::erDao::
	等待到指定地图("艾尔莎岛")	
	移动(144,105)
	移动(157,93)
	转向(2)	
	等待到指定地图("艾夏岛")		
	goto aiXiaDao
	
::aiXiaDao::					--去医院
	移动(112, 81)	
	goto erYiYuan
::erYiYuan::	
	等待到指定地图("医院")	
	移动(34, 46)
	移动(35, 46)
	移动(35, 47)
	移动(35, 45)
	移动(35, 47)
	renew(1)        			-- 恢复人宠        
	等待(8000)
	移动(28, 47)
	if(队伍("人数") < 队伍人数)then	--数量不足 等待
		等待队伍人数达标(练级地名称)
	end	
	移动(28, 52)	
	等待到指定地图("艾夏岛")	
	goto toSenLin
::toSenLin::					--去练级点		
	等待到指定地图("艾夏岛")
	移动(190, 116)	
	goto toGaoDi
::toGaoDi::
	等待到指定地图("盖雷布伦森林")
	移动(231, 222)	
	goto toUpgradePos
::toUpgradePos::
	等待到指定地图("布拉基姆高地")	
	移动(练级坐标x,练级坐标y)	         
	goto kaishi
::kaishi::						--开始遇敌		
	开始遇敌()      
	goto battle
::battle::						--状态判断			--自动遇敌中 循环判断血魔
	if (人物("血") < 补血值 )then		
		日志(人物("血").."<"..补血值.."回补",1)
		goto back
	elseif (人物("魔") < 补魔值 )then	
		日志(人物("魔").."<"..补血值.."回补",1)
		goto back
	elseif (宠物("血") < 宠补血值 )then	
		日志(宠物("血").."<"..宠补血值.."回补",1)
		goto back
	elseif (宠物("魔") < 宠补魔值 )then	
		日志(宠物("魔").."<"..宠补魔值.."回补",1)
		goto back
	elseif 是否战斗中() then
		遇敌总次数=遇敌总次数+1
		等待战斗结束()
	end		
	等待(1000)	
	goto battle      
::back::						--回补
	停止遇敌()                 	-- 结束战斗			
	日志("共遇敌次数"..遇敌总次数,2,3,5)
	common.statistics(练级前时间,练级前经验,练级前宠经验,练级前金币)	--统计脚本效率		
	等待(1000)
	移动(30,193)	
	等待到指定地图("盖雷布伦森林")	
	移动(199, 211)
	等待到指定地图("艾夏岛")		
	移动(112, 88)
	-- if(是否卖石 == 1)then 
		-- 移动(102, 115)	
		-- goto sale 
	-- end
	移动(112, 81)	
	goto erYiYuan
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
布拉基姆高地练级(44,130, 190,"黄金龙骨")