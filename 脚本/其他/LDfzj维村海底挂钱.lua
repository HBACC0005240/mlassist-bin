ld维村海底打石脚本+++ge cheng deng ru

设置("timer", 100)						-- 设置定时器，单位毫秒

-- 设定自动战斗设置
设置("自动战斗", 1)				-- 开启自动战斗，0不自动战斗，1自动战斗
设置("高速战斗", 4)			-- 高速战斗时的操作等待时间单位秒，3以上为好，不然容易断线
设置("高速延时", 6)			-- 高速战斗速度，0速度最低，6速度最高

维村补魔值=用户输入框( "多少魔以下去维村补给", "100")
维村补血值=用户输入框( "多少血以下去维村补给", "100")
维村宠补魔值=用户输入框( "宠多少魔以下去维村补给", "100")
维村宠补血值=用户输入框( "宠多少血以下去维村补给", "100")
是否打卡=用户输入框( "是否打卡，是填10000，不是填0", "0")


-- 设定自动及保护设置
				-- 自动遇敌
			-- ::0::园圈自动遇敌，1东西，2南北，3随机
设置("timer", 300)				-- 设置脚本运行计时器，单位毫秒
			-- 设置自动遇敌计时器，单位毫秒



::beginxz::
	回城()
	等待(3000)
        
	等待到指定地图("艾尔莎岛", 1)
	
	
	转向(1, "")
	等待服务器返回()
	对话选择("4", "", "")
	
	等待到指定地图("里谢里雅堡", 1)
	
	移动(30, 82)
        移动(30, 79)
	
	卖(0, "魔石")		-- 转向北边卖石
	
        printf("钱")
        移动(30, 82)
        移动(30, 90)
        移动(34, 90)
        移动(34, 88)
        
	回复(2)		-- 恢复人宠
	
        移动(34, 90)
        移动(30, 90)
        移动(30, 82)
        移动(41, 82)
        移动(41, 71)
	goto start_1 

::falan_start::
	移动(153, 104)
	移动( 153, 100)
	等待到指定地图("里谢里雅堡", 1)
	if(人物("血") > 是否打卡)then goto  "start_1" end
	移动(41, 85)
	移动(45, 81)
	移动(56, 81)
	移动(58, 83)
	
	
	转向(4, "")
	等待服务器返回()
	
	对话选择("4", "", "")
	等待服务器返回()
	对话选择("1", "", "")
	移动(41, 83)


::start_1::
	移动(41, 52)
	移动( 41, 50)
	等待到指定地图("里谢里雅堡 1楼", 1)
	移动(74, 33)
	移动(65, 24)
	移动(46, 24)
	移动( 45, 20)
	等待到指定地图("启程之间", 1)

	移动(25, 27)
	移动(21, 27)
	移动(17, 23)
	移动(8, 23)
	
	
	转向(0, "")
	等待服务器返回()
	对话选择("4", "", "")
	

	等待到指定地图("维诺亚村的传送点", 1)
	
	移动( 5, 1)
	

	等待到指定地图("村长家的小房间", 1)
	
	移动(8, 3)
	移动(6, 5)
	移动(3, 5)
	移动( 0, 5)
	
	等待到指定地图("村长的家", 1)
	
	移动(13, 10)
	移动(10, 13)
	移动( 10, 16)
	

	等待到指定地图("维诺亚村", 1)
	
	移动(41, 37)
	移动(41, 44)
	移动(43, 46)
	移动(65, 46)

::begin::
	移动( 67, 46)
	
	等待到指定地图("芙蕾雅", 1)
	
	移动(334, 480)
	移动(337, 483)
	移动(337, 486)
	移动(341, 490)
	移动(341, 496)
	移动( 343, 497)
	
	等待到指定地图("索奇亚海底洞窟 地下1楼", 1)
	
	移动(10, 8)
	移动(11, 9)
	移动(11, 13)
	移动(12, 14)
	开始遇敌()		-- 开始自动遇敌

::scriptstart::
	if("物品", "魔石", "null", "满", salebegin)			-- 魔石满后跳转到salebegin卖石
	if(人物("魔") < 维村补魔值)then goto  salebegin end		-- 魔少于150时跳转到salebegin加血
	if(人物("血") < 维村补血值)then goto  salebegin end		-- 血少于250时跳转到salebegin加血
	if(宠物("血") < 维村宠补血值)then goto  salebegin end		-- 宠血少于250时跳转到salebegin加血
	if(宠物("魔") < 维村宠补魔值)then goto  salebegin end		-- 宠血少于250时跳转到salebegin加血
	goto scriptstart 		-- 继续自动遇敌

::salebegin::				-- 此处开始卖石加血过程
	
	停止遇敌()				-- 结束战斗
        
        
	移动(12, 12)
        回城()
        goto beginxz 



