半山小岛单烧技能(半山5锄头路线)


common=require("common")
	设置("timer",100)
	
	--设置("高速延时",0)  
	设置("高速战斗",1)  
	设置("自动战斗",1)  
	设置("遇敌速度",20)  

	补血值=用户输入框("多少血以下去补给","400")
	补魔值=用户输入框("多少魔以下去补给","400")
	宠补血值=用户输入框("宠多少血以下补血","100")
	宠补魔值=用户输入框("宠多少魔以下去补给","400")

技能名称="超强恢复魔法"

function 技能等级()
	local playerData = 人物信息()
	for i,skill in ipairs(playerData.skill) do
		if(skill.name == 技能名称)then
			日志("技能等级："..技能名称..skill.lv)
			return skill.lv
		end
	end
	return 0
end
function 拿钱()
	if(人物("金币") < 100000) then
		common.gotoBankTalkNpc()
	end
::begin::
	if(人物("金币") < 100000) then
		移动(41,30)
		转向(2)
		银行("取钱",-500000)
		if(银行("金币") < 500000 and 人物("金币") < 500000)then
			转向(4)
			交易("￠秋雨￡落￠","","金币:500000",10000)
		end
	else
		return
	end
	goto begin
end
::begin::
	停止遇敌()	
	等待空闲()
	common.checkHealth()
	common.supplyCastle()
	if(技能等级() >= 10)then
		读取配置("配置/96练技能强力回复.save")
	end
	拿钱()
	回城()
	等待到指定地图("艾尔莎岛")
	等待(500)
	扔("锄头")
	等待(500)
	转向(1,"")
	等待服务器返回()
	对话选择("4","","")
	等待到指定地图("里谢里雅堡")	
	移动(34,89)
	回复(1)	
	移动(31,83)
	goto chufa 

::chufa::	    
	移动(42,50)	
	等待到指定地图("里谢里雅堡 1楼")       
	移动(75,20)        
	移动(75,19)	
	等待到指定地图("里谢里雅堡 2楼")        
	移动(44,75)
	移动(1,75)        
	移动(0,75)	
	等待到指定地图("图书室")
	移动(27,18)
	移动(27,16)           
	转向(0,"")
	等待服务器返回()
	对话选择("32","","")	
	等待服务器返回()
	对话选择("4","","")	
	等待服务器返回()
	对话选择("1","","")    	
	等待到指定地图("小岛")	
	移动(64,90)
	开始遇敌()	
	goto jiance 

::jiance::
	
	if(人物("血") < 补血值)then goto begin end
	if(人物("魔") < 补魔值)then goto begin end
	if(宠物("血") < 宠补血值)then goto begin end
	if(宠物("魔") < 宠补魔值)then goto begin end
	goto jiance 
