★起点艾尔莎岛登入点，亚村传送开启脚本。


common=require("common")
       
::start::
	common.checkHealth()
	common.supplyCastle()	    
	common.outFaLan("e")		
	移动(672, 223,"哈巴鲁东边洞穴 地下1楼")	
	移动(41, 8,"哈巴鲁东边洞穴 地下2楼")
::xiongnan::
	移动(17, 18)	
	穿墙(17, 16)			
	等待(2000)
	移动(16, 11,"哈巴鲁东边洞穴 地下1楼")	
	移动(30, 4,"芙蕾雅")	
	移动(595, 84,"亚留特村")	
	移动(56, 48,"村长的家")
	移动(22, 9,"亚留特村的传送点")
	移动(5, 15)
	转向(0)
	等待(1000)