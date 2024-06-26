★雪塔50\55\60\65\70\75\79楼队长脚本。楼层可以自己选定。起点国民会馆108.42附近。
     
设置("timer", 0)						-- 设置定时器，单位毫秒  						
设置("高速延时", 4)                     -- 高速战斗时的操作等待时间单位秒，3以上为好，不然容易断线
                     -- 设置遇敌方式3为随机4为原地

雪塔补魔值=用户输入框( "多少魔以下补魔", "100")
雪塔补血值=用户输入框( "多少血以下补血", "100")
雪塔宠补血值=用户输入框( "宠多少血以下补血", "100")
雪塔宠补魔值=用户输入框( "宠多少魔以下补魔", "100")
是否50=用户复选框("是否在T50楼练级",1)
是否55=用户复选框( "是否在T55楼练级", "0")
是否60=用户复选框( "是否在T60楼练级", "0")
是否65=用户复选框( "是否在T65楼练级", "0")
是否70=用户复选框( "是否在T70楼练级", "0")
是否75=用户复选框( "是否在T75楼练级", "0")
是否79=用户复选框( "是否在T79楼练级", "0")
是否85=用户复选框( "是否在T85楼练级", "0")

::begin::  
	--等待空闲()
	mapName=取当前地图名()
	mapNum=取当前地图编号()	
	if(mapName=="艾尔莎岛")then	goto aiersha	
	elseif (mapName=="利夏岛" )then	goto map59522
	elseif (mapName=="国民会馆" )then goto map59552	
	elseif (mapName=="雪拉威森塔１层" )then goto map59801
	elseif (mapName=="雪拉威森塔５０层" )then goto map59850
	--elseif (mapName=="雪拉威森塔４０层" )then goto map59840
	--elseif (mapName=="雪拉威森塔３９层" )then goto map59839
	end
	common.supplyCastle()
	common.sellCastle()		--默认卖
	common.checkHealth()
	common.checkCrystal(水晶名称)	
	回城()
	goto begin 
::aiersha::	
	
	common.checkHealth()
	自动寻路(165, 153)
	转向(4)
	等待服务器返回()
	对话选择(32,0)
	等待服务器返回()
	对话选择(4, 0)		
	等待(1000)
::map59522::					--利夏岛
	if(取当前地图名() ~= "利夏岛")then
		goto begin
	end
	自动寻路(90,99,"国民会馆")
	goto care 
::map59552::
	等待到指定地图("国民会馆", 1)

::care::
	自动寻路(112, 50)
	自动寻路(109, 50)
	自动寻路(109, 51)
	自动寻路(107, 51)
	自动寻路(109, 51)
	回复(5)         -- 恢复人宠	
	等待(13000)      
	自动寻路(109, 50)
	自动寻路(112, 50)
	自动寻路(112, 46)
	自动寻路(109, 42)
	自动寻路(109, 43)
	自动寻路(109, 42)
	自动寻路(109, 43)
	自动寻路(109, 42)
	卖(2, "魔石")
	
	等待(13000)
	自动寻路(108, 42)
::jinta::
	自动寻路(108, 40)	
  	自动寻路(108, 39)

::map59801::
	等待到指定地图("雪拉威森塔１层")	
  	自动寻路(75, 50)
::map59850::
::panding::
	等待到指定地图("雪拉威森塔５０层", 1)
	
	if(是否50 )then goto  t50 end
	if(是否55 )then goto  lu1 end
	if(是否60 )then goto  lu1 end
	if(是否65 )then goto  lu1 end
	if(是否70 )then goto  lu1 end
	if(是否75 )then goto  lu1 end
	if(是否79 )then goto  lu1 end
	if(是否85)then goto  lu1 end


::t50::
	等待到指定地图("雪拉威森塔５０层")	
	等待(2000) 
	开始遇敌()         
::scriptstart50::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin50 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin50 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin50 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin50 end
	goto scriptstart50        
::salebegin50::	
	停止遇敌() 	
	自动寻路(77, 59)	
	自动寻路(78, 59)
	等待到指定地图("雪拉威森塔１层", 1)
	
	自动寻路(75, 60)
	goto huibu  



::lu1::		
	if(是否50 )then goto  lu2 end
	if(是否55 )then goto  lu2 end
	if(是否60 )then goto  lu2 end
	if(是否65 )then goto  lu2 end
	if(是否70 )then goto  lu2 end
	if(是否75 )then goto  lu3 end
	if(是否79 )then goto  lu3 end
	if(是否85 )then goto  lu3 end
::lu2::		
	if(是否55 )then goto  t55 end
	if(是否60 )then goto  t60 end
	if(是否65 )then goto  t65 end
	if(是否70 )then goto  t70 end
::t55::
  	自动寻路(27, 55,"雪拉威森塔５５层")	
	等待(2000)   

	开始遇敌()         
::scriptstart55::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin55 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin55 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin55 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin55 end
	goto scriptstart55        
::salebegin55::
	
	停止遇敌() 
	
	自动寻路(132, 93)
	
	自动寻路(133, 93)
	等待到指定地图("雪拉威森塔５０层", 1)
	
	自动寻路(27, 59)
	goto huibu1  


::t60::
  	自动寻路(25, 55)
	等待到指定地图("雪拉威森塔６０层")	
	等待(2000)
	开始遇敌()         
::scriptstart60::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin60 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin60 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin60 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin60 end
	goto scriptstart60        
::salebegin60::
	
	停止遇敌() 	
	自动寻路(95, 145)	
	自动寻路(95, 144)
	等待到指定地图("雪拉威森塔５０层")	
	自动寻路(25, 59)	
	自动寻路(27, 59)
	goto huibu1  

::t65::
	自动寻路(23, 59)	
	自动寻路(23, 56)	
  	自动寻路(23, 55)
	等待到指定地图("雪拉威森塔６５层")	
	等待(2000) 
	开始遇敌()         
::scriptstart65::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin65 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin65 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin65 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin65 end
	goto scriptstart65        
::salebegin65::	
	停止遇敌() 
	自动寻路(148, 54)
	等待到指定地图("雪拉威森塔５０层")	
	自动寻路(23, 59)
	自动寻路(27, 59)
	goto huibu1  

::t70::
  	自动寻路(21, 55)
	等待到指定地图("雪拉威森塔７０层")	
	等待(2000)       
	开始遇敌()         
::scriptstart70::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin70 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin70 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin70 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin70 end
	goto scriptstart70        
::salebegin70::	
	停止遇敌() 
	自动寻路(78, 55)
	等待到指定地图("雪拉威森塔５０层")	
	自动寻路(27, 59)
	goto huibu1  


::lu3::		
	if(是否75)then goto  t75 end
	if(是否79)then goto  t79 end
	if(是否85)then goto  t85 end

::t75::
	自动寻路(24, 45)	
  	自动寻路(24, 44)
	等待到指定地图("雪拉威森塔７５层")
	等待(2000)     

	开始遇敌()         
::scriptstart75::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin75 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin75 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin75 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin75 end
	goto scriptstart75        
::salebegin75::	
	停止遇敌() 
	自动寻路(137, 133)
	等待到指定地图("雪拉威森塔５０层")	
	自动寻路(24, 47)
	goto huibu2  



::t79::
	自动寻路(22, 47)
	
	自动寻路(22, 45)
	
  	自动寻路(22, 44)
	等待到指定地图("雪拉威森塔８０层")

  	自动寻路(159, 123)
	
	等待到指定地图("雪拉威森塔７９层")
	等待(2000)      
	开始遇敌()         
::scriptstart79::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin79 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin79 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin79 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin79 end
	goto scriptstart79        
::salebegin79::	
	停止遇敌() 	
	自动寻路(161, 122)
	等待到指定地图("雪拉威森塔８０层")	
  	自动寻路(162, 122)
	等待到指定地图("雪拉威森塔５０层")
	自动寻路(24, 47)
	goto huibu2  

::t85::
	自动寻路(20, 44)		
	等待(2000)      
	开始遇敌()         
::scriptstart85::    
	if(人物("魔") < 雪塔补魔值)then goto  salebegin85 end         
	if(人物("血") < 雪塔补血值)then goto  salebegin85 end
	if(宠物("血") < 雪塔宠补血值)then goto  salebegin85 end
	if(宠物("魔") < 雪塔宠补魔值)then goto  salebegin85 end
	等待(3000)
	goto scriptstart85        
::salebegin85::	
	停止遇敌() 	
	自动寻路(58, 131)
	等待到指定地图("雪拉威森塔５０层")
	自动寻路(24, 47)
	goto huibu2  

::huibu::	
	自动寻路(33, 99)	
	等待到指定地图("国民会馆")      
	等待(2000) 
	
	自动寻路(108, 46)
	自动寻路(112, 46)
	自动寻路(112, 50)
	goto care 


::huibu1::	
	自动寻路(63, 47)	
	goto hui1lou 


::huibu2::
	自动寻路(62, 47)	
	goto hui1lou 

::hui1lou::
	自动寻路(78, 59)	
	等待到指定地图("雪拉威森塔１层")	
	自动寻路(75, 60)
	goto huibu  

