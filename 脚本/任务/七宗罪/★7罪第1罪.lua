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
       
	自动寻路(31,82)
	自动寻路(31,90)
	自动寻路(34,90)
	自动寻路(34,90)
	自动寻路(34,87)
	自动寻路(34,89)
	回复(1)			-- 转向北边恢复人宠血魔
	
	等待(12000)
        自动寻路(34,90)
	自动寻路(31, 90)
        自动寻路(31, 80)
        自动寻路(33, 80)
        自动寻路(33, 71)
        自动寻路(35, 71)
        自动寻路(33, 71)
	等待(1000)
        
        转向(1, "")
        等待服务器返回()
        
        对话选择("32", "", "")
        等待服务器返回()
        对话选择("4", "", "")
        等待服务器返回()
        对话选择("1", "", "")
	等待(12000)
        自动寻路(41, 71)
        自动寻路(41, 53)
        自动寻路(41, 50)
	
	等待到指定地图("里谢里雅堡 1楼", 1)
	
        自动寻路(74, 24)
	
        自动寻路(45, 24)
	
        自动寻路(45, 20)
	
	等待到指定地图("启程之间", 1)
	
        自动寻路(25, 29)
	
        自动寻路(18, 29)
	
        自动寻路(18, 15)
	
        自动寻路(14, 11)
	
        自动寻路(14, 5)
	
        自动寻路(17, 5)
        自动寻路(15, 5)
	等待(10000)
	
	转向(1, "")
	等待服务器返回()
	对话选择("4", "(null)", "")
	等待(3000)
	自动寻路(6,9)
	goto wancheng 
::jnwcf::
	等待(1000)
       
	等待(1000)
	
        自动寻路(6, 8)
	
        自动寻路(14, 8)
	
        自动寻路(14, 6)
	
	等待到指定地图("村长的家", 1)
	
        自动寻路(13, 9)
	
        自动寻路(1, 9)
	
	等待到指定地图("杰诺瓦镇", 1)
	
        自动寻路(44, 43)
	
        自动寻路(44, 39)
	
        自动寻路(24, 39)
	
	等待到指定地图("莎莲娜", 1)
	
        自动寻路(199, 456)
	
        自动寻路(184, 471)
	
        自动寻路(156, 471)
	
        自动寻路(151, 476)
	
        自动寻路(142, 476)
	
        自动寻路(142, 444)
	
        自动寻路(175, 411)
	
        自动寻路(175, 397)
	
        自动寻路(181, 391)
	
        自动寻路(181, 383)
	
        自动寻路(192, 372)
	
        自动寻路(197, 372)
	
        自动寻路(206, 363)
	
        自动寻路(210, 363)
	
        自动寻路(214, 359)
	
        自动寻路(214, 354)
	
        自动寻路(210, 350)
	
        自动寻路(190, 350)
	
        自动寻路(190, 330)
	
        自动寻路(185, 325)
	
        自动寻路(180, 325)
	
        自动寻路(158, 347)
	
        自动寻路(149, 347)
	
        自动寻路(149, 335)
	
        自动寻路(151, 335)
	
        自动寻路(149, 335)
	
        
        转向(1, "")
        等待服务器返回()
        
        对话选择("1", "", "")
	等待到指定地图("贝兹雷姆小道", 1)
        自动寻路(32, 52)
	goto wancheng 
::xiaodao::
        自动寻路(32, 53)
        自动寻路(28, 49)
	
        自动寻路(28, 48)
	
        自动寻路(27, 48)
	
        自动寻路(21, 42)
	
        自动寻路(21, 20)
	
        自动寻路(17, 16)
	
        自动寻路(17, 4)
        自动寻路(29, 4)
        自动寻路(29, 3)
	等待(3000)
        自动寻路(67, 42)
        自动寻路(70, 42)
        自动寻路(70, 55)
	
        自动寻路(59, 55)
	
        自动寻路(59, 48)
	
        自动寻路(63, 44)
	
        自动寻路(63, 37)
	
        自动寻路(71, 37)
	
        自动寻路(71, 33)
	
        自动寻路(62, 33)
	
        自动寻路(62, 17)
	
        自动寻路(65, 17)
	
        自动寻路(65, 28)
	
        自动寻路(73, 28)
	
        自动寻路(73, 25)
	
        自动寻路(69, 25)
	
        自动寻路(69, 21)
	
        自动寻路(73, 21)
	
        自动寻路(73, 14)
	
        自动寻路(61, 14)
	
        自动寻路(61, 2)
	
        自动寻路(72, 2)
	
        自动寻路(72, 9)
	
        自动寻路(67, 9)
	
        自动寻路(67, 8)
        自动寻路(67, 7)
	等待(3000)
        自动寻路(104, 3)
        自动寻路(106, 5)
	
        自动寻路(106, 13)
	
        自动寻路(102, 17)
	
        自动寻路(101, 17)
	
        自动寻路(101, 26)
	
        自动寻路(104, 26)
	
        自动寻路(107, 29)
        自动寻路(108, 29)
	等待(3000)
        自动寻路(106, 88)
        自动寻路(106, 74)
        自动寻路(106, 73)
	等待(3000)
        自动寻路(61, 97)
	
        自动寻路(61, 84)
	
        自动寻路(59, 84)
	
        自动寻路(59, 94)
	
        自动寻路(55, 94)
	
        自动寻路(55, 97)
	
        自动寻路(53, 97)
	
        自动寻路(53, 91)
	
        自动寻路(55, 91)
	
        自动寻路(55, 84)
	
        自动寻路(53, 84)
	
        自动寻路(53, 88)
	
        自动寻路(50, 88)
	
        自动寻路(50, 97)
	
        自动寻路(46, 97)
	
        自动寻路(46, 81)
	
        自动寻路(43, 81)
        自动寻路(43, 97)
        自动寻路(43, 98)
	等待(3000)
        自动寻路(9, 78)
        自动寻路(9, 77)
	等待(3000)
        自动寻路(14, 15)
	
        
        转向(0, "")
        等待服务器返回()
        
        对话选择("1", "", "")
	
	
	等待(3000)
        转向(0, "")
	等待到指定地图("暗房", 1)
        自动寻路(12, 11)
        
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
