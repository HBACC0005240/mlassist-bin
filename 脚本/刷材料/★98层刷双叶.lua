全程自动跑98层刷箱子！遇到：艾德奇美拉 欧奴奇美拉 艾克尼奇美拉 伊鲁特奇美拉 欧特奇美拉可设置逃跑！

	
设置("自动战斗", 1)			-- 开启自动战斗，0不自动战斗，1自动战斗
设置("高速战斗", 1)			-- 开启高速战斗
设置("高速延时", 4)			-- 高速战斗速度，0不延时 
设置("遇敌全跑", 1)			-- 开启遇敌全跑 
设置("自动加血", 0)			-- 关闭自动加血，脚本对话加血 
走路加速值=120	
走路还原值=100	
doctorName="星落护士"

common=require("common")


     
补魔值=用户输入框( "多少魔以下去补给", "100")
补血值=用户输入框( "多少血以下去补给", "1")
宠补魔值=用户输入框( "宠多少魔以下去补给", "50")
宠补血值=用户输入框( "宠多少血以下去补给", "1")

::lookbu::
	local needSupply = false
	if(人物("血") < 人物("最大血") or 人物("魔") < 人物("最大魔")) then
		needSupply=true
	end
	if(宠物("血") < 宠物("最大血") or 宠物("魔") < 宠物("最大魔")) then
		needSupply=true
	end
	if(needSupply == false)then
		goto kaishi
	end
	回城()
	等待到指定地图("艾尔莎岛")	
	转向(1)
	等待服务器返回()
	对话选择(4,0)	
	等待到指定地图("里谢里雅堡")		
	移动(34, 89)	
	回复(1)	
	common.healPlayer(doctorName)
	common.recallSoul()
	等待(2000)
	goto kaishi 
	
::kaishi::
	等待空闲()
	当前地图名=取当前地图名()	
	if(当前地图名=="雪拉威森塔９６层")then	
		goto T96
	elseif(当前地图名=="雪拉威森塔９７层")then		
		goto T97
	elseif(当前地图名=="雪拉威森塔９８层")then		
		goto T98	
	end
	common.healPlayer(doctorName)
	common.recallSoul()
	common.supplyCastle()
	if(取物品数量("塞特的护身符") > 0)then goto  saite end
	if(取物品数量("梅雅的护身符") > 0)then goto  meiya end
	if(取物品数量("提斯的护身符") > 0)then goto  tisi end
	if(取物品数量( "谜语箱４") >  2)then goto  sale_2 end
	if(当前地图名=="艾尔莎岛")then		
		goto 雪拉威森塔
	end
	回城()
	goto kaishi
::雪拉威森塔::		
	移动(165, 153)	
	转向(4)
	等待服务器返回()	
	对话选择(32,0)
	等待服务器返回()
	对话选择(4, 0)	
	等待到指定地图("利夏岛")		
	移动(90,99,"国民会馆")
	移动(108, 54)	
	回复(0)		
	移动(108, 39)	
	等待到指定地图("雪拉威森塔１层")		
	移动(75, 50)	
	等待到指定地图("雪拉威森塔５０层")		
	移动(16, 44)	
	等待到指定地图("雪拉威森塔９５层")	
	移动(26, 104)
	移动(27, 104)		
	转向(2)
	等待服务器返回()	
	对话选择("32", "", "")	
	对话选择("4", "", "")	
	对话选择("32", "", "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９６层")		
	goto lookbu

	
::saite::	
	使用物品("塞特的护身符")
	等待服务器返回()
	对话选择("4", "", "")	
	等待到指定地图("雪拉威森塔９５层")		
	转向(2, "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９６层")			
::T96::
	移动(86, 120)
	移动(87, 119)			
	转向(1, "")
	等待服务器返回()	
	对话选择("32", "", "")	
	等待服务器返回()	
	对话选择("32", "", "")	
	等待服务器返回()	
	对话选择("4", "", "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９７层")		
	goto lookbu

::meiya::	
	使用物品("梅雅的护身符")
	等待服务器返回()
	对话选择("4", "", "")	
	等待到指定地图("雪拉威森塔９６层")	
	转向(2, "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９７层")	
::T97::
	移动(117, 126)	
	转向(0)
	等待服务器返回()	
	对话选择("32", "", "")	
	对话选择("32", "", "")	
	对话选择("32", "", "")	
	对话选择("4", "", "")
	等待服务器返回()
	对话选择("1", "", "")	
	等待到指定地图("雪拉威森塔９８层")		
	goto lookbu
::tisi::	
	使用物品("提斯的护身符")
	等待服务器返回()
	对话选择("4", "", "")	
	等待到指定地图("雪拉威森塔９７层")	
	转向(2)
	等待服务器返回()
	对话选择("1", "", "")		
::T98::	
	等待到指定地图("雪拉威森塔９８层")	
	移动(116, 90)
	移动(116, 105)
::yd::
	开始遇敌()         -- 开始自动遇敌
	goto scriptstart 
::scriptstart::	
	if(人物("血") < 补血值)then goto  ting end
	if(人物("魔") < 补魔值)then goto  ting end
	if(宠物("血") < 宠补血值)then goto  ting end
	if(宠物("魔") < 宠补魔值)then goto  ting end
	等待(2000)
	goto scriptstart          --自动遇敌中 循环判断血魔
::ting::
	清除系统消息()
	停止遇敌()
	goto lookbu

::sale_2::			-- 存银行
	等待到指定地图("艾尔莎岛")
	移动(143,108)
	移动(157,94)        
	转向(1)	
	等待到指定地图("艾夏岛")	
	移动(114, 104,"银行")		
	移动(49,25)
	转向(2)
	等待服务器返回()
::sale_4::
    银行("全存","谜语箱４")
	等待(2000)
	if(取包裹空格() < 2)then
		goto End
	end
	if(取物品数量( "谜语箱４") >  0)then goto  sale_4 end
	goto kaishi 
::End::
	日志("包裹满了，结束",1)
	等待(15000)
	goto End 
