--10A灵魂之袍银行取奥利哈刚条版 需20空格 银行存好奥利哈刚条 一次做8个  By 星落

common=require("common")


::begin::			-- 取银行	
	等待空闲()
	if(取物品叠加数量("奥利哈钢条") < 8)then 
		goto naKuang
	end
	if(取物品叠加数量("开米士毛线") < 50)then 
		goto maiMaoXian
	end
	if(取物品叠加数量("杰诺瓦线") < 100)then 
		goto tojrwcmb
	end
	if(取物品叠加数量("绢布") < 100)then 
		goto towryc
	end
	if(取物品叠加数量("绵") < 100)then 
		goto maimian
	end
	goto make	
::naKuang::	
	common.gotoBankTalkNpc()
	银行("取物","奥利哈钢条",20)
	goto begin
       
::maiMaoXian::
	common.toTeleRoom("阿巴尼斯村")
	等待到指定地图("阿巴尼斯村的传送点")
	等待(1000)
	移动(5, 8)
	移动( 5, 4)
	等待到指定地图("村长的家")
	等待(1000)
	移动(9, 8)
	移动(12, 5)	
	转向(1)                 
	等待服务器返回()
	common.buyDstItem("开米士毛线",50)	
	if(取物品叠加数量("杰诺瓦线") < 100)then 
		goto qjrwcmb
	end
::qjrwcmb::
	等待(1000)
	移动(9, 8)
	移动(9, 9)
	等待(1000)
	等待到指定地图("阿巴尼斯村的传送点")	
	移动(5, 8)	
	移动(5, 14)	
	转向(4)
	等待服务器返回()
	对话选择("4", 0)
	等待到指定地图("启程之间")	
	移动(15, 5)	
	转向(1)
	等待服务器返回()
	对话选择("4", "", "")	
	goto jrwcmb
::tojrwcmb::
	common.toTeleRoom("杰诺瓦镇")
::jrwcmb::
	等待到指定地图("杰诺瓦镇的传送点")	
	移动(14,6,"村长的家")	     
	移动(1,9,"杰诺瓦镇") 	
	移动(43,23,"杂货店")	
	移动(9, 12)
	移动(11,12)	
	转向(2, "")                 
	等待服务器返回()
	common.buyDstItem("杰诺瓦线",100)			
	if(取物品叠加数量("绢布") < 100)then 
		goto qwrycmb
	end
::qwrycmb::
	等待(1000)
	移动(10, 13)
	移动(10, 15)
	移动( 10, 16)
	等待到指定地图("杰诺瓦镇")        
	移动(43, 43)
	移动( 58, 43)
	等待到指定地图("村长的家")	
	移动(13, 9)
	移动( 13, 7)      
	等待到指定地图("杰诺瓦镇的传送点")		
	移动(13, 8)
	移动(7, 8)	
	转向(0)
	等待服务器返回()
	对话选择("4", 0)
	等待到指定地图("启程之间")	
	移动(8, 23)	
	转向(0)
	等待服务器返回()
	对话选择("4", "", "")	
	等待(1000)
	goto wrycmb
::towryc::
	common.toTeleRoom("维诺亚村")
::wrycmb::
	等待到指定地图("维诺亚村的传送点")	
	移动( 5, 1)	
	等待到指定地图("村长家的小房间")		
	移动( 0, 5)	
	等待到指定地图("村长的家")	
	移动(9, 15)
	移动( 9, 16)         --出村长家
	等待到指定地图("维诺亚村")	   
	移动( 56, 42)
	等待到指定地图("装备品店")	    
	移动(13, 9)
    移动(13, 8)	
	转向(0)
	等待服务器返回()	
	common.buyDstItem("绢布",100)	
	goto begin 	
::maimian::
	回城()	
	等待(1000)	
	转向(1, "")
	等待服务器返回()
	对话选择("4", "", "")
	等待(1000)
	等待到指定地图("里谢里雅堡")	
	移动(37, 82)
	移动(41, 86)
	移动(41, 97)	
	移动( 40, 98)
	等待(500)
	等待到指定地图("法兰城")	
	移动(153, 123)
	移动(115, 123)
	移动(115, 112)
	移动(116, 112)	
	移动(117, 112)
	等待(1000)
	等待到指定地图("流行商店")		
	移动(8, 7)	
	转向(0, "")                 
	等待服务器返回()
	common.buyDstItem("绵",100)			
	回城()	
	goto begin 
::make::
	等待(500)	
	转向(1, "")
	等待服务器返回()
	对话选择("4", "", "")
	等待(1000)
	等待到指定地图("里谢里雅堡")	
	移动(27, 90)
	移动(33, 90)
	移动(34, 89)
	回复(1)	
::work::								-- 开始工作		
	合成("灵魂之袍")	
	if(取物品数量( "奥利哈钢条") >  0)then goto  pause end			-- 物品大于指定值时跳转、
	if(取包裹空格() < 1) then goto  pause end			-- 物品大于指定值时跳转、
	if(取物品数量( "灵魂之袍") ==10 )then goto back end			-- 物品大于指定值时跳转
	if(人物("魔") <  109) then goto  bumo end
	goto work 
::pause::
	叠("棉", 20)
	叠("杰诺瓦线", 20)	
	叠("开米士毛线", 20)
	叠("杰诺瓦线", 20)	
	叠("绢布", 20)	
	叠("奥利哈刚条", 40)
	goto work 
::bumo::	
	回复(1)
	
	叠("棉", 20)
	叠("杰诺瓦线", 20)	
	叠("开米士毛线", 20)
	叠("杰诺瓦线", 20)	
	叠("绢布", 20)	
	叠("奥利哈刚条", 40)
	if(取物品数量( "灵魂之袍") ==10 )then goto back end
	goto work 
::back::
	 喊话("制作完毕",0,0,0)
	等待(1000)
        喊话("制作完毕",0,0,0)
	