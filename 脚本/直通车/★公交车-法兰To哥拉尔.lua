启动地点，法兰，艾尔莎岛，哥拉尔传送石。阿凯鲁法只支持记忆。

设置("timer", 100)

common=require("common")


是否定居=用户输入框("定居否？是11111，否0","11111")
::begin::
	当前地图名 = 取当前地图名()
	x,y=取当前坐标()    
	if (当前地图名=="铁达尼号" )then	
		goto  tdn  
	elseif (当前地图名=="艾尔莎岛" )then	
		goto  star1  
	elseif (x==99 and y==165 )then	
		goto  jiyi    
	elseif (x==72 and y==123 )then	-- 西2登录点
		goto  w2	-- 西2登录点
	elseif (x==233 and y==78 )then	-- 东2登录点
		goto  e2
	elseif (x==162 and y==130 )then	-- 南2登录点
		goto  s2
	elseif (x==63 and y==79 )then	-- 西1登录点
		goto  w1
	elseif (x==242 and y==100 )then	-- 东1登录点
		goto  e1
	elseif (x==141 and y==148 )then	-- 南1登录点
		goto  s1
	end	
	goto  begin

::jiyi::
	if(取物品数量("黑之记忆") > 0 )then 
		goto hei
	elseif(取物品数量("白之记忆") > 0 )then 
		goto bai
	end
	goto  begin

::hei::	
	使用物品("黑之记忆")
	等待服务器返回()
	对话选择(4, 0)	
	等待到指定地图("黑之祭坛", 1)	
	移动(23, 18)	
	转向(1)
	等待服务器返回()
	对话选择(4, 0)	
	等待到指定地图("召唤之间")	
	移动( 3, 7)	
	等待到指定地图("里谢里雅堡", 1)	
	goto liBao

::bai::
	
	使用物品("白之记忆")
	等待服务器返回()
	对话选择(4, 0)
	
	等待到指定地图("白之祭坛", 1)
	
	移动(22, 26)
	
	
	转向(5)
	等待服务器返回()
	对话选择(4, 0)
	
	等待到指定地图("召唤之间", 1)
	
	移动(7,14)
	移动(7,15)
	移动(3,15)
	移动(3,8)
	移动( 3, 7)
	
	
	等待到指定地图("里谢里雅堡", 1)
	

::liBao::
	等待到指定地图("里谢里雅堡", 47, 85)
	移动(47, 90)
	移动(51,90)
	移动(51,93)
	
	goto goto2


::w2::	-- 西2登录点
	转向(2, "")		-- 转向东
	
	等待到指定地图("法兰城",233,78)
	
	转向(0, "")		-- 转向北
	
	等待到指定地图("市场一楼 - 宠物交易区", 46, 16)
	
	转向(0, "")		-- 转向北
	
	等待到指定地图("法兰城", 162, 130)
	
	移动(153,130)
	goto begin_1	

::e2::	-- 东2登录点
	转向(0, "")		-- 转向北
	
	等待到指定地图("市场一楼 - 宠物交易区", 46, 16)
	
	转向(0, "")		-- 转向北
	
	等待到指定地图("法兰城", 162, 130)
	
	移动(153,130)
	goto begin_1		

::s2::	-- 南2登录点
	等待到指定地图("法兰城", 162, 130)
	
	移动(153,130)
	goto begin_1		

::w1::	-- 西1登录点
	转向(0, "")		-- 转向北
	
	等待到指定地图("法兰城", 242, 100)
	
	转向(2, "")		-- 转向东
	
	等待到指定地图("市场三楼 - 修理专区", 46, 16)
	
	转向(0, "")		-- 转向北
	
	等待到指定地图("法兰城", 141, 148)
	
	移动(153,148)
	移动(153,130)
	goto begin_1			

::e1::	-- 东1登录点
	转向(2, "")		-- 转向东
	
	等待到指定地图("市场三楼 - 修理专区", 46, 16)
	
	转向(0, "")		-- 转向北
	
	等待到指定地图("法兰城", 141, 148)
	
	移动(153,148)
	移动(153,130)
	goto begin_1			

::s1::	-- 南1登录点
	等待到指定地图("法兰城", 141, 148)
	
	移动(153,148)
	移动(153,130)
	goto begin_1			

::begin_1::
	移动(153, 105)	
	移动( 153, 100)	
	等待到指定地图("里谢里雅堡", 1)
	移动(41, 69)
	goto goto2


::star1::
	common.toTeleRoom("伊尔村")
	goto ylt
	-- 移动(140,105)
	-- 转向(1)
	-- 等待服务器返回()
	-- 对话选择(4, 0)
	-- 等待到指定地图("里谢里雅堡", 1)
	-- 转向(2)
	-- 移动(28, 82)

::goto2::
	移动(41,50)
	等待到指定地图("里谢里雅堡 1楼")	
	移动(45,20)
	等待到指定地图("启程之间")
	移动(43, 33)	
	转向(1)
	等待服务器返回()
	对话选择(4, 0)		
	goto ylt
::ylt::
	等待到指定地图("伊尔村的传送点", 1)
	移动(12, 17)
	等待到指定地图("村长的家", 1)
	移动(6, 13)
	等待到指定地图("伊尔村", 1)
	移动(58, 71)
	转向(2, "")
	等待服务器返回()
	对话选择(4, 0)
	等待到指定地图("伊尔", 1)
	移动(30, 21)
	等待到指定地图("港湾管理处", 1)
	移动(25, 25)
	转向(0, "")
	等待服务器返回()
	对话选择("32", "", "")
	等待服务器返回()
	对话选择(4, 0)
	等待到指定地图("往哥拉尔栈桥", 1)
	移动(45, 57)
	移动(51, 51)
	移动(52, 51)
::gle::
	转向(0, "")
	等待服务器返回()
	对话选择(4, 0)

	等待(15000)
	if(取当前地图名() == "铁达尼号")then
		goto tdn
	end	
	goto gle
::tdn::
	等待(150000)
::tdn1::	
	if(string.find(最新系统消息(),"本船已到达了哥拉尔港")~=nil)then
		goto xia
	end
	goto tdn1
::xia::
	移动(70, 26)
	转向(2)
	等待服务器返回()
	对话选择(4, 0)
	等待(2000)
	if(取当前地图名() == "往伊尔栈桥")then
		goto tig
	end
	goto xia
::tig::
	移动(50,56)
	移动(84,56)
	移动(84,55)
	转向(0, "")
	等待服务器返回()
	对话选择(4, 0)
	等待到指定地图("哥拉尔镇 港湾管理处")
	移动(14,7)
	移动(14,14)
	移动(14,15)
	等待到指定地图("哥拉尔镇")	
	移动(118,214)
	转向(2)
	等待到指定地图("哥拉尔镇",120,107)
	if(是否定居 == 0)then
		 goto quit1
	 end 	
	移动(118, 107)
	移动(118, 106)
	转向(0)
	等待服务器返回()
	对话选择(4, 0)
	移动(118, 107)
	移动(120, 107)

::quit1::
	等待(10000)
