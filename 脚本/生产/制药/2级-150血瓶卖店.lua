
 
common=require("common")

--设置("高速延时",3) 
设置("自动加血",0)
设置("高速延时",4)  
设置("高速战斗",1)  
设置("自动战斗",1)  
设置("遇敌全跑",1)  
设置("自动叠",1,"生命力回复药（150）&3")
设置("自动叠",1,"苹果薄荷&40")
设置("自动叠",1,"柠檬草&40")
设置("自动扔",1,"卡片？")
设置("自动扔",1,"魔石")
设置("自动扔",1,"盐")
身上最少金币=5000			--少于去取
身上最多金币=950000			--大于去存
身上预置金币=200000			--取和拿后 身上保留金币
苹果薄荷数量=320
柠檬草数量=320

function 采集苹果薄荷()
	while true do
		if(取包裹空格() < 1)then break end	-- 包满回城
		if(取物品叠加数量('苹果薄荷')>= 苹果薄荷数量)then break end	
		if(人物("魔") <  1)then break end	-- 魔无回城
		if(取当前地图名() ~= "芙蕾雅")then break end	--地图切换 也返回
		工作("伐木","",6500)	--技能名 物品名 延时时间
		等待工作返回(6500)
	end 
	扔叠加物("苹果薄荷",40)
end
function 采集柠檬草()
	while true do
		if(取包裹空格() < 1)then break end	-- 包满回城
		if(取物品叠加数量('柠檬草')>= 柠檬草数量)then break end	
		if(人物("魔") <  1)then break end	-- 魔无回城
		if(取当前地图名() ~= "芙蕾雅")then break end	--地图切换 也返回
		工作("伐木","",6500)	--技能名 物品名 延时时间
		等待工作返回(6500)
	end 
	扔叠加物("柠檬草",40)
end

function main()

::begin::
	等待空闲()
	common.checkGold(身上最少金币,身上最多金币,身上预置金币)
	mapName=取当前地图名()
	if(mapName=="芙蕾雅")then			--加在这，主要是随时启动脚本原地复原
		goto 去采集材料
	end
	if(取物品叠加数量("生命力回复药（150）") >= 3)then
		--扔叠加物("生命力回复药（100）",3)
		common.sellCastle("生命力回复药（150）")		--默认卖
	end
	common.supplyCastle()
	common.checkHealth()
	common.outFaLan("w")	--西门
	goto begin

::去采集材料::	
	if(目标是否可达(500,85) == false)then	--不是西门芙蕾雅 回城
		回城()
		goto begin
	end
	if(取物品叠加数量('苹果薄荷')< 苹果薄荷数量)then					
		自动寻路(500,85)
		采集苹果薄荷()
		goto begin
	end
	if(取物品叠加数量('柠檬草')< 柠檬草数量)then					
		自动寻路(515,100)
		采集柠檬草()
		goto begin
	end
	common.supplyCastle()
::work::
	合成("生命力回复药（150）")	
	if(取包裹空格() < 1) then goto  pause end			
	if(取物品叠加数量( "苹果薄荷") < 10 )then goto begin end			
	if(人物("魔") <  16) then 
		common.supplyCastle() 		
	end
	goto work 
::pause::	
	叠("生命力回复药（150）", 3)	
	叠("苹果薄荷", 40)
	叠("柠檬草", 40)	
	goto work 
end
main()

