宠物人形系和植物系坐骑技能学习,进去不要乱走动，会传送到一层

::begin::	
	等待空闲()		
	local 当前地图名 = 取当前地图名()	
	if (当前地图名=="艾尔莎岛" )then		
		goto aiDao		
	elseif (当前地图名=="国民会馆" )then	
		goto 国民会馆	
	end
	回城()
	等待(1000)
	goto begin
::aiDao::
	设置("移动速度",走路加速值)	
	自动寻路(165,153)
	等待(1000)	
	对话选是(4)	
::liXiaDao::
	等待到指定地图("利夏岛")	
	自动寻路(90,99,"国民会馆")
::国民会馆::				
	自动寻路(109,51)
	回复(108,52)
	自动寻路(109,50)
	--60层
	自动寻路(108,39,"雪拉威森塔１层")
	自动寻路(75, 50,"雪拉威森塔５０层")
	自动寻路(25, 55,"雪拉威森塔６０层")	
	--第一个陷阱区  没写坐标，需要局部坐标寻路
	--第二个陷阱区
	自动寻路(99, 92)
	自动寻路(102, 93)
	自动寻路(102, 91)
	自动寻路(108, 91)
	自动寻路(108, 107)
	自动寻路(115, 107)
	自动寻路(115, 120)
	自动寻路(99,166,"雪拉威森塔６１层")
::map59861::		--61层
	自动寻路(289, 219)
	对话选是(290, 219)
	if(取物品数量("普塔的照片") < 1)then
		goto map59861
	end
	自动寻路(198,19,"雪拉威森塔６２层")
::map59862::
	自动寻路(52,114)
	对话选是(51, 114)
	自动寻路(46,106)
	--对话选是(46, 105)