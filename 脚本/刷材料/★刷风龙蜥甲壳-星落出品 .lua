★刷火魂脚本，起点艾尔莎岛登入点，请设置好自动战斗,战斗1中设置好遇一级宠时的战斗方法 ::战斗2设置好宠物满下线保护，谢谢支持魔力辅助程序.脚本发现BUG联系Q::274100927-----------星落


设置("timer", 300)						

set("高速遇敌",1)
				-- 自动遇敌
设置("自动战斗",1)
设置("高速战斗", 4)
设置("高速延时",1)
		--原地遇敌      
人补魔=用户输入框( "人多少魔以下补魔", "50")
人补血=用户输入框( "人多少血以下补血", "300")
宠补魔=用户输入框( "宠多少魔以下补魔", "50")
宠补血=用户输入框( "宠多少血以下补血", "200")	
InputVal("自动换水火的水晶耐久值", "多少耐久以下自动换水火的水晶,不换可不填", "30")        
::start::
	
	回城()
	等待(3000)
	等待到指定地图("艾尔莎岛", 1)
        
	转向(1, "RECV_HEAD_crXf")		-- 转向北
	对话选择("4", "", "RECV_HEAD_GUZ")
	等待到指定地图("里谢里雅堡", 1)
	移动(31,82)
	移动(31,90)
	移动(34,90)
	移动(34,90)
	移动(34,87)
	移动(34,89)
	回复(1)			-- 转向北边恢复人宠血魔
	
	等待(1500)
        移动(34,90)
	移动(31, 90)
        移动(31, 80)
        移动(41, 80)
        移动(41, 53)
	if(取物品数量("水火的水晶（5：5）") < 1)then goto  maika end
	移动(41, 50)
	
	等待到指定地图("里谢里雅堡 1楼", 1)
	
        移动(74, 24)
	
        移动(45, 24)
	
        移动(45, 20)
	
	等待到指定地图("启程之间", 1)
	
        移动(25, 29)
	
        移动(18, 29)
	
        移动(18, 15)
	
        移动(14, 11)
	
        移动(14, 5)
	
        移动(15, 4)
        if(取物品数量( "传送石优待卷") >  0)then goto  mfgcs2 end	
	
	转向(2, "")
	等待服务器返回()
	对话选择("4", "(null)", "")
	goto jnwcf 
::mfgcs2::
        
        转向(2, "")
        等待服务器返回()
        
        对话选择("4", "", "")
        等待服务器返回()
        对话选择("1", "", "")
        
::jnwcf::
	
        移动(6, 8)
	
        移动(14, 8)
	
        移动(14, 6)
	
	等待到指定地图("村长的家", 1)
	
        移动(13, 9)
	
        移动(1, 9)
	
	等待到指定地图("杰诺瓦镇", 1)
	
        移动(44, 43)
	
        移动(44, 39)
	
        移动(24, 39)
	
	等待到指定地图("莎莲娜", 1)
	
        移动(199, 456)
	
        移动(184, 471)
	
        移动(166, 471)
	
        开始遇敌()		-- 开始自动遇敌
	goto scriptstart 
::scriptstart::
	if(人物("魔") < 人补魔)then goto  salebegin end		-- 魔小于100
	if(人物("血") < 人补血)then goto  salebegin end
	if(宠物("血") < 宠补血)then goto  salebegin end
	if(宠物("魔") < 宠补魔)then goto  salebegin end
	if("耐久", "7", "<", "自动换水火的水晶耐久值", checkcrystalnow)
	goto scriptstart 		-- 继续自动遇敌
::salebegin::
	停止遇敌()				-- 结束战斗
	
	等待(3000)
	goto start 
::checkcrystalnow::
	if(取物品数量("水火的水晶（5：5）") < 1)then goto  start end
	停止遇敌()						-- 结束战斗
	
	等待(1000)
	扔("7")
	等待(1000)
	装备物品("水火的水晶（5：5）", 7)
	等待(1000)
	goto scriptstart 
	

::maika::
	移动(17,53)
	等待到指定地图("法兰城", 1)
	等待(500)
	移动(92,88)
	移动(92,78)
	移动(94,78)
	
	等待到指定地图("达美姊妹的店", 1)
	
	移动(10,13)
	移动(13,16)
	移动(17,16)
	移动(17,18)
	
	等待(1000)
	
	
::maishuijing::
	
	转向(2, "")             
	等待服务器返回()
	
	对话选择("0", "1", "")
	等待服务器返回()
	
	对话选择("0", "10\z2", "")          
	等待服务器返回()
	
	goto start 
::action::
        if("状态","Character._action_count",<,2,defense)
        if("状态","Character._action_count",>,1,escape)

::defense::
        set(auto_action, ManAction, "5")
        set(auto_action, ManActionSkill, "中毒魔法")
        set(auto_action, ManActionSkillLevel, "0")
        setobj("人", "null", "血少优先", "null", "普通", "敌")
        set(auto_action, PetAction, 100)
        set(auto_action, PetActionSkill, "护卫-Ⅴ")
        setobj("宠", "null", "null", "null", "普通", "人")
        end_action_set

::escape::
        set(auto_action, ManAction, "2")
        set(auto_action, ManActionSkill, "逃跑")
        set(auto_action, ManActionSkillLevel, "0")
        setobj("人", "null", "null", "null", "普通", "null")
        set(auto_action, PetAction, 100)
        set(auto_action, PetActionSkill, "护卫-Ⅴ")
        setobj("宠", "null", "null", "null", "普通", "人")
        end_action_set



