★七宗罪1罪队长脚本，起点艾尔莎岛登入点，根据提示执行脚本。卖屁屁版脚本——QQ：33037738 


设置("timer", 320)						

       
	等待(2000)
       
::start::
	if(取当前地图名() ==  "杰诺瓦镇的传送点")then goto jnwcf end
	if(取当前地图名() ==  "贝兹雷姆小道")then goto xiaodao end
	等待到指定地图("艾尔莎岛", 1)
        
	转向(1, "RECV_HEAD_crXf")		-- 转向北
	对话选择("4", "", "RECV_HEAD_GUZ")
	等待到指定地图("里谢里雅堡", 1)
	等待(1000)
       
	移动(31,82)
	移动(31,90)
	移动(34,90)
	移动(34,90)
	移动(34,87)
	移动(34,89)
	回复(1)			-- 转向北边恢复人宠血魔
	
	等待(12000)
        移动(34,90)
	移动(31, 90)
        移动(31, 80)
        移动(33, 80)
        移动(33, 71)
        移动(35, 71)
        移动(33, 71)
	等待(1000)
        
        转向(1, "")
        等待服务器返回()
        
        对话选择("32", "", "")
        等待服务器返回()
        对话选择("4", "", "")
        等待服务器返回()
        对话选择("1", "", "")
	等待(12000)
        移动(41, 71)
        移动(41, 53)
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
	
        移动(17, 5)
        移动(15, 5)
	等待(10000)
	
	转向(1, "")
	等待服务器返回()
	对话选择("4", "(null)", "")
	等待(3000)
	移动(6,9)
	goto wancheng 
::jnwcf::
	等待(1000)
       
	等待(1000)
	
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
	
        移动(156, 471)
	
        移动(151, 476)
	
        移动(142, 476)
	
        移动(142, 444)
	
        移动(175, 411)
	
        移动(175, 397)
	
        移动(181, 391)
	
        移动(181, 383)
	
        移动(192, 372)
	
        移动(197, 372)
	
        移动(206, 363)
	
        移动(210, 363)
	
        移动(214, 359)
	
        移动(214, 354)
	
        移动(210, 350)
	
        移动(190, 350)
	
        移动(190, 330)
	
        移动(185, 325)
	
        移动(180, 325)
	
        移动(158, 347)
	
        移动(149, 347)
	
        移动(149, 335)
	
        移动(151, 335)
	
        移动(149, 335)
	
        
        转向(1, "")
        等待服务器返回()
        
        对话选择("1", "", "")
	等待到指定地图("贝兹雷姆小道", 1)
        移动(32, 52)
	goto wancheng 
::xiaodao::
        移动(32, 53)
        移动(28, 49)
	
        移动(28, 48)
	
        移动(27, 48)
	
        移动(21, 42)
	
        移动(21, 20)
	
        移动(17, 16)
	
        移动(17, 4)
        移动(29, 4)
        移动(29, 3)
	等待(3000)
        移动(67, 42)
        移动(70, 42)
        移动(70, 55)
	
        移动(59, 55)
	
        移动(59, 48)
	
        移动(63, 44)
	
        移动(63, 37)
	
        移动(71, 37)
	
        移动(71, 33)
	
        移动(62, 33)
	
        移动(62, 17)
	
        移动(65, 17)
	
        移动(65, 28)
	
        移动(73, 28)
	
        移动(73, 25)
	
        移动(69, 25)
	
        移动(69, 21)
	
        移动(73, 21)
	
        移动(73, 14)
	
        移动(61, 14)
	
        移动(61, 2)
	
        移动(72, 2)
	
        移动(72, 9)
	
        移动(67, 9)
	
        移动(67, 8)
        移动(67, 7)
	等待(3000)
        移动(104, 3)
        移动(106, 5)
	
        移动(106, 13)
	
        移动(102, 17)
	
        移动(101, 17)
	
        移动(101, 26)
	
        移动(104, 26)
	
        移动(107, 29)
        移动(108, 29)
	等待(3000)
        移动(106, 88)
        移动(106, 74)
        移动(106, 73)
	等待(3000)
        移动(61, 97)
	
        移动(61, 84)
	
        移动(59, 84)
	
        移动(59, 94)
	
        移动(55, 94)
	
        移动(55, 97)
	
        移动(53, 97)
	
        移动(53, 91)
	
        移动(55, 91)
	
        移动(55, 84)
	
        移动(53, 84)
	
        移动(53, 88)
	
        移动(50, 88)
	
        移动(50, 97)
	
        移动(46, 97)
	
        移动(46, 81)
	
        移动(43, 81)
        移动(43, 97)
        移动(43, 98)
	等待(3000)
        移动(9, 78)
        移动(9, 77)
	等待(3000)
        移动(14, 15)
	
        
        转向(0, "")
        等待服务器返回()
        
        对话选择("1", "", "")
	
	
	等待(3000)
        转向(0, "")
	等待到指定地图("暗房", 1)
        移动(12, 11)
        
        转向(6, "")
        等待服务器返回()
        
        对话选择("1", "", "")
	
	
	等待(5000)
        
        转向(0, "")
        等待服务器返回()
        
        对话选择("32", "", "")
        
        对话选择("32", "", "")
        
        对话选择("32", "", "")
        
        对话选择("32", "", "")
        
        对话选择("32", "", "")
        
        对话选择("1", "", "")
	等待(2000)

::wancheng::
    
	等待(7000)
	goto wancheng 
