启动地点阿凯鲁法传送石

设置("timer", 100)

local dlg=nil
::begin::
	清除系统消息()
	转向(0)		-- 转向北	
	自动寻路(140, 214,"白之宫殿")	
	自动寻路( 23, 70,"启程之间")	
	自动寻路(9, 7)
	自动寻路(11, 7)	
	转向(2)
	dlg=等待服务器返回()
	if(dlg.message~=nil and (string.find(dlg.message,"此传送点的资格")~=nil or string.find(dlg.message,"不能使用这个传送石")~=nil))then			
		自动寻路(9,16,"43210")
		自动寻路(9,46,"43200")
		自动寻路(41,22,"哥拉尔镇")	
		自动寻路(165,91,"医院")
		自动寻路(29,26)	
		回复(30,26)
		自动寻路(9,23,"哥拉尔镇")		
		自动寻路(176,105,"库鲁克斯岛")			
		自动寻路(476,526)
		对话选是(477,526)
		自动寻路(315,822,"伊利斯矿山 地下1楼")
		自动寻路(41,7,"伊利斯矿山入口 大坑道")
		自动寻路(188,12,"伊利斯矿山 地下1楼")
		自动寻路(85,93,"库鲁克斯岛")		
		自动寻路(431,824,"米诺基亚镇")		
		自动寻路(68,118,"村长之家")		
		自动寻路(6,12,"村长之家2楼")	
		自动寻路(19,14)			
		转向(2)
		转向(2)
	end	
	等待服务器返回()
	对话选择("4", "", "")	
	
