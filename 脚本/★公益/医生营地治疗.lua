设置脚本简介("起点支持新城登陆点和城堡打卡处,请自己设置战斗")
设置("timer",100)
补魔值 = 100

function 去营地()
::dengru::
	local 当前地图名 = 取当前地图名()
	if (当前地图名=="艾尔莎岛" )then	
		goto star1
	elseif (当前地图名=="里谢里雅堡" )then	
		goto star2
	elseif (当前地图名=="法兰城" )then	
		goto begin
	end	
::star1::
	自动寻路(140,105)
	等待(500)
	面向("东北")
	等待服务器返回()
	对话选择(4,0)	
	等待到指定地图("里谢里雅堡")	
	自动寻路(41,82)
    goto star2
::star2::		
	自动寻路(41,98)	
    goto begin
::begin::		
	等待到指定地图("法兰城")	
	自动寻路(153,239)
	自动寻路(153,241)	
	等待到指定地图("芙蕾雅")	
	自动寻路(424,264)	
	自动寻路(468,264)	
	自动寻路(468,266)	
	自动寻路(498,266)	
	自动寻路(503,274)	
	自动寻路(506,280)	
	自动寻路(511,282)	
	自动寻路(513,282)	
	等待(1000)	
	等待到指定地图("曙光骑士团营地")	
	自动寻路(30,59)
	自动寻路(30,51)
	自动寻路(55,51)
	自动寻路(55,48)
	自动寻路(55,47)	
	等待(1000)	
	等待到指定地图("辛希亚探索指挥部",1,10)
	自动寻路(6,10)
	自动寻路(6,4)
	自动寻路(7,4)	
	等待到指定地图("辛希亚探索指挥部",91,6)
	自动寻路(91,9)
	自动寻路(94,9)
	自动寻路(95,9)
	等待(1000)	
	等待到指定地图("辛希亚探索指挥部",19,28)	
	自动寻路(19,30)
	自动寻路(14,30)
	自动寻路(14,24)
	自动寻路(7,24)
	自动寻路(6,22)
	自动寻路(8,22)	
	自动寻路(6,22)
	自动寻路(7,22)  	
	面向("北")		-- 转向北	
	等待(2000)
	自动寻路(96,86)
    goto dao
::dao::
	喊话("营地到了，等待猪的出现",2,3,5)
	等待(1000)
    goto dao

end
function main()
::begin::
	等待空闲()
	local 当前地图名 = 取当前地图名()
	local x,y=取当前坐标()	
	if (当前地图名 =="艾尔莎岛" )then goto quYingDi
	elseif(当前地图名 ==  "里谢里雅堡")then goto quYingDi 
	elseif(当前地图名 ==  "法兰城")then goto quYingDi 	
	elseif(当前地图名 ==  "圣骑士营地")then goto quYiYuan
	elseif(当前地图名 ==  "医院")then goto scriptstart
	end	
	回城()
	等待(1000)
	goto begin
::quYingDi::
	去营地()
	goto begin
::quYiYuan::
	自动寻路( 95, 73)
	自动寻路( 95, 72,"医院")
	goto bu 
::scriptstart::	
	if(人物("魔") < 补魔值)then goto bu end		
	if(取当前地图编号() ~= 44692) then goto begin end
	等待(2000)
	goto scriptstart  
::bu::
	自动寻路(18,15)     
	回复(0)		
	自动寻路(13,16)   
    工作("治疗",4)     
	goto scriptstart
end
main()