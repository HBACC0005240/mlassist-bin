设置脚本简介("4转厨师自动刷锅子脚本,需要最少19个空格，启动点, 艾尔莎岛。请设置脚本停止160秒重启。因为要购买酱油和砂糖 请多备点钱 需要狩猎5级   设置自动叠加盐，酱油，砂糖，葱，寿喜锅 牛肉 盐  自动扔碎片 魔石 以及哥布林 盗贼 迷你蝙蝠卡片等。   星落制作：274100927 ")

common=require("common")
设置("自动叠",1,"寿喜锅&3")
设置("自动叠",1,"牛肉&40")
设置("自动叠",1,"盐&40")
设置("自动叠",1,"葱&40")
设置("自动叠",1,"酱油&40")
设置("自动扔",1,"火焰鼠闪卡「D1奖」|火焰鼠闪卡「D2奖」|火焰鼠闪卡「D3奖」|火焰鼠闪卡「D4奖」|火焰鼠闪卡「C1奖」|火焰鼠闪卡「C2奖」|火焰鼠闪卡「C3奖」|火焰鼠闪卡「C4奖」|宝石鼠残念奖|宝石鼠铜奖|宝石鼠银奖|宝石鼠金奖|黑暗之戒|宝石？|迷之手册|迷之晶体|鼠娃娃兑换券|魅惑的哈密瓜|魅惑的哈密瓜面包|印度轻木|34583|34584|34585|34586|蕃茄|封印卡（昆虫系）|封印卡（野兽系)|封印卡（人形系）|封印卡（金属系）|封印卡（龙系）|封印卡（特殊系）|封印卡（植物系）|封印卡（飞行系）|封印卡（不死系）|鼠王的卡片|鹿皮|鸡蛋|铜|苹果薄荷|勾玉的戒指|宝石鼠洋娃娃|大地鼠洋娃娃|火焰鼠洋娃娃|恶梦鼠洋娃娃|试验红药水|面包|特制雕鱼烧|生命力回复药（75）")
设置("自动治疗",1)
设置("自动战斗",1)
设置("高速战斗",1)
设置("遇敌全跑",1)
设置("自动加血",0)
设置("移动速度",110)
采集速度=5500			--过快掉线 调这个


::begin::	
	-- if(取当前地图名() == "布拉基姆高地")then goto startwork end
	-- if(取当前地图名() == "索奇亚")then goto work end
	-- if(取当前地图名() == "盖雷布伦森林")then goto startwork1 end
    回城()
	等待到指定地图("艾尔莎岛")
	转向(1)
	等待服务器返回()
	对话选择("4", "", "")
	等待到指定地图("里谢里雅堡")		
    扔叠加物("葱", 20)	
	扔叠加物("盐", 20)
	扔叠加物("牛肉", 20)
	移动(34,89)
	回复(1)	
	if(取物品数量("砂糖") >0)then goto make end	
	goto Startbegin
::make::
	if(取物品数量("砂糖") < 1)then goto Startbegin end			
	回复(2)	
	合成("寿喜锅", 0)
	叠("寿喜锅",3)	
	叠("盐",40)	
	叠("酱油",40)	
	叠("牛肉",40)	
	叠("葱",40)
	goto make

::Startbegin::
	回城()
	等待到指定地图("艾尔莎岛")	
	扔叠加物("葱", 20)	
	扔叠加物("盐", 20)
	扔叠加物("牛肉", 20)
	if(人物("血") < 50)then goto begin end	
	if(人物("魔") < 50)then goto begin end	
	if(取物品数量("寿喜锅") > 1)then goto cun end			
	if(取物品数量("酱油") == 3)then goto weiruoya end			
	if(取物品数量("牛肉") == 3)then goto yiercun end			
	if(取物品数量("盐") == 3)then goto niurou end		
	移动(157,93)	
	转向(2)	
	等待到指定地图("艾夏岛",84,112)	
	转向(6)
	等待到指定地图("艾夏岛",164,159)					
	转向(7)				
	等待到指定地图("艾夏岛",151,97)		
	移动(190,116,"盖雷布伦森林")
	if(取物品数量("葱") == 3)then goto startwork1 end		
	移动(231, 222,"布拉基姆高地")		
	移动(61, 195)	
	goto startwork

::startwork::
	if(取物品数量("葱") > 3)then goto begin end	
	if(人物("魔") < 1)then goto begin end	
	工作("狩猎","",采集速度)	
	等待工作返回(采集速度)
	goto startwork

::startwork1::
	if(取物品数量("盐") > 3)then goto begin end	
	if(人物("魔") < 1)then goto begin end	
	工作("狩猎","",采集速度)	
	等待工作返回(采集速度)
	goto startwork1

::niurou::	
	common.toTeleRoom("奇利村")	
	goto ylt
::ylt::
	等待到指定地图("奇利村的传送点")
    移动(7, 6,"村长的家")	
    移动(7, 1,"村长的家")
	移动(1, 8,"奇利村")	
    移动(79, 76,"索奇亚")	
	移动(321,336)	
	转向(6)
	扔("卡片?")
	扔("魔石")
	扔("地的水晶碎片")
	扔("水的水晶碎片")
	扔("火的水晶碎片")
	扔("风的水晶碎片")
::work::
	工作("狩猎","",采集速度)	
	if(取物品数量("牛肉") > 3)then goto begin end	
	if(人物("魔") < 1)then goto begin end		      
	等待工作返回(采集速度)    
	goto work


::yiercun::
	common.toTeleRoom("伊尔村")		
	等待到指定地图("伊尔村的传送点")
	移动(12, 17,"村长的家")
	移动(6, 13,"伊尔村")
	移动(32, 65,"旧金山酒吧")	
	移动(18, 11)	
::maijiangyou::		
	转向(2)                 
	等待服务器返回()	
	对话选择(0, 0)
	等待服务器返回()	
	买(2,120)
	goto begin
::weiruoya::
	等待到指定地图("艾尔莎岛")	
	common.toTeleRoom("维诺亚村")		
	等待到指定地图("维诺亚村的传送点")	
	移动(5, 1,"村长家的小房间")		
	移动(9, 5,"村长的家")
	移动(11, 6)		
	转向(2)                 
	等待服务器返回()	
	对话选择(0, 0)
	等待服务器返回()	
	买(0,120)
	goto begin
::cun::
	等待到指定地图("艾尔莎岛")
	移动(157,94)	
	转向(1)
	等待到指定地图("艾夏岛")   
	移动(114,104,"银行")		
	移动(49,25)	
	转向(2)
	等待服务器返回()
::Bank::
	银行("全存", "寿喜锅", "3")
	等待(1000)
	if(银行("已用空格") == 80)then goto Sale end	
	if(取物品数量("寿喜锅") > 1)then goto Bank end	
	if(取物品数量("寿喜锅") == 1)then goto panduan end		
	日志("人物当前金币"..人物("金币"))
	goto begin
::panduan::
	if(取物品叠加数量("寿喜锅") > 2)then goto Bank end	
	goto begin
::panduan1::
	扔("砂糖")
	等待(500)
	if(取物品数量("砂糖") > 3)then goto ren end	
::ren::
	扔("砂糖")
	等待(5000)
	移动(140,109)
	扔("砂糖")
	if(取物品数量("砂糖") < 1)then goto begin end	
	goto ren
::Sale::	
	喊话("银行满了，转移完了重新执行",2,3,5)	
	等待(5000)
	goto Sale