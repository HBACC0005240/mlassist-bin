全程自动跑猫，要求定居新城，带高血防护卫宠护卫自己，全程设置逃跑
设置("timer", 100)				

::kaishi::
回城()
等待到指定地图("艾尔莎岛", 1)
等待(200)

if(取物品数量("塞特的护身符") > 0)then goto  saite end
if(取物品数量("梅雅的护身符") > 0)then goto  meiya end
if(取物品数量("提斯的护身符") > 0)then goto  tisi end
if(取物品数量("伍斯的护身符") > 0)then goto  wusi end
if(取物品数量("尼斯的护身符") > 0)then goto  nisi end
自动寻路(140, 126)
自动寻路(165, 151)
自动寻路(165, 153)


转向(4, "")
等待服务器返回()

对话选择("32", "", "")
等待服务器返回()
对话选择("4", "", "")


等待到指定地图("利夏岛", 1)

等待(200)

自动寻路(93, 64)
自动寻路(90, 67)
自动寻路(90, 98)

自动寻路( 90, 99)


等待到指定地图("国民会馆", 1)

等待(200)

自动寻路(100, 50)
自动寻路(104, 54)
自动寻路(108, 54)

回复(1)


等待(600)

自动寻路(104, 54)
自动寻路(104, 46)
自动寻路(108, 42)
自动寻路(108, 39)


等待到指定地图("雪拉威森塔１层", 1)

等待(300)

自动寻路(37, 99)
等待(200)

自动寻路(42, 99)
自动寻路(46, 95)
自动寻路(54, 87)
自动寻路(62, 79)
自动寻路(67, 74)
自动寻路(72, 74)
自动寻路(72, 69)
自动寻路(72, 63)
自动寻路(74, 61)
自动寻路(74, 52)
自动寻路(75, 51)

自动寻路(75, 50)

等待到指定地图("雪拉威森塔５０层", 1)

等待(200)

自动寻路(74, 56)
自动寻路(74, 47)
自动寻路(16, 47)
自动寻路(16, 46)
等待(200)

自动寻路(16, 44)

等待到指定地图("雪拉威森塔９５层", 1)

等待(600)

自动寻路(101, 51)
自动寻路(109, 51)
自动寻路(109, 63)
自动寻路(95, 63)
自动寻路(94, 64)
自动寻路(81, 64)
自动寻路(81, 76)
自动寻路(49, 76)
自动寻路(49, 88)
自动寻路(57, 88)
自动寻路(57, 100)
自动寻路(49, 100)
自动寻路(49, 92)
自动寻路(45, 92)
自动寻路(45, 88)
自动寻路(41, 88)
自动寻路(41, 94)
自动寻路(33, 102)
自动寻路(33, 112)
自动寻路(45, 112)
自动寻路(45, 125)
自动寻路(33, 125)
自动寻路(33, 120)
自动寻路(26, 120)
自动寻路(26, 116)
自动寻路(28, 116)
自动寻路(28, 112)
自动寻路(26, 112)
自动寻路(26, 104)
自动寻路(27, 104)

等待(200)


转向(2, "")
等待服务器返回()

对话选择("32", "", "")

对话选择("4", "", "")

对话选择("32", "", "")
等待服务器返回()
对话选择("1", "", "")


等待到指定地图("雪拉威森塔９６层", 1)

等待(200)

回城()

等待到指定地图("艾尔莎岛", 1)



转向(1, "")
等待服务器返回()
对话选择("4", "", "")


等待到指定地图("里谢里雅堡", 1)

等待(200)


自动寻路(30, 82)
自动寻路(30, 90)
自动寻路(33, 90)
自动寻路(34, 89)


回复(1)


::saite::

使用物品("塞特的护身符")
等待服务器返回()
对话选择("4", "", "")

等待到指定地图("雪拉威森塔９５层", 1)

等待(200)


转向(2, "")
等待服务器返回()
对话选择("1", "", "")

等待到指定地图("雪拉威森塔９６层", 1)

等待(200)

自动寻路(30, 105)
自动寻路(28, 105)
自动寻路(25, 108)
自动寻路(19, 108)
自动寻路(19, 112)
自动寻路(27, 112)
自动寻路(27, 120)
自动寻路(30, 120)
自动寻路(30, 113)
自动寻路(38, 113)
自动寻路(38, 101)
自动寻路(46, 101)
自动寻路(46, 113)
自动寻路(54, 113)
自动寻路(54, 89)
自动寻路(50, 89)
自动寻路(50, 76)
自动寻路(53, 76)
自动寻路(53, 68)
自动寻路(51, 68)
自动寻路(51, 64)
自动寻路(53, 64)
自动寻路(57, 60)
自动寻路(63, 60)
自动寻路(63, 65)
自动寻路(86, 65)
自动寻路(86, 84)
自动寻路(92, 84)
自动寻路(92, 77)
自动寻路(114, 77)
自动寻路(114, 97)
自动寻路(99, 97)
自动寻路(99, 100)
自动寻路(103, 100)
自动寻路(103, 105)
自动寻路(99, 105)
自动寻路(99, 108)
自动寻路(102, 108)
自动寻路(102, 127)
自动寻路(87, 142)
自动寻路(87, 145)
自动寻路(66, 145)
自动寻路(66, 129)
自动寻路(78, 129)
自动寻路(78, 118)
自动寻路(82, 118)
自动寻路(82, 120)
自动寻路(86, 120)
自动寻路(87, 119)

等待(200)


转向(1, "")
等待服务器返回()

对话选择("32", "", "")

对话选择("32", "", "")

对话选择("4", "", "")
等待服务器返回()
对话选择("1", "", "")


等待到指定地图("雪拉威森塔９７层", 1)

等待(200)

回城()

等待到指定地图("艾尔莎岛", 1)

等待(200)



转向(1, "")
等待服务器返回()
对话选择("4", "", "")


等待到指定地图("里谢里雅堡", 1)

等待(200)


自动寻路(30, 82)
自动寻路(30, 90)
自动寻路(33, 90)
自动寻路(34, 89)


回复(1)


::meiya::

使用物品("梅雅的护身符")
等待服务器返回()
对话选择("4", "", "")

等待到指定地图("雪拉威森塔９６层", 1)

等待(200)


转向(2, "")
等待服务器返回()
对话选择("1", "", "")

等待到指定地图("雪拉威森塔９７层", 1)

等待(200)

自动寻路(90, 119)
自动寻路(106, 119)
自动寻路(106, 103)
自动寻路(118, 103)
自动寻路(118, 97)
自动寻路(124, 91)
自动寻路(130, 91)
自动寻路(130, 102)
自动寻路(134, 106)
自动寻路(134, 111)
自动寻路(126, 111)
自动寻路(126, 127)
自动寻路(134, 127)
自动寻路(134, 143)
自动寻路(127, 143)
自动寻路(127, 150)
自动寻路(115, 150)
自动寻路(115, 147)
自动寻路(121, 147)
自动寻路(121, 143)
自动寻路(115, 143)
自动寻路(115, 139)
自动寻路(126, 139)
自动寻路(126, 135)
自动寻路(86, 135)
自动寻路(86, 131)
自动寻路(112, 131)
自动寻路(117, 126)

等待(200)


转向(8, "")
等待服务器返回()

对话选择("32", "", "")

对话选择("32", "", "")

对话选择("32", "", "")

对话选择("4", "", "")
等待服务器返回()
对话选择("1", "", "")


等待到指定地图("雪拉威森塔９８层", 1)

等待(200)

回城()

等待到指定地图("艾尔莎岛", 1)

等待(200)



转向(1, "")
等待服务器返回()
对话选择("4", "", "")


等待到指定地图("里谢里雅堡", 1)

等待(200)


自动寻路(30, 82)
自动寻路(30, 90)
自动寻路(33, 90)
自动寻路(34, 89)


回复(1)


::tisi::

使用物品("提斯的护身符")
等待服务器返回()
对话选择("4", "", "")

等待到指定地图("雪拉威森塔９７层", 1)

等待(200)


转向(2, "")
等待服务器返回()
对话选择("1", "", "")

等待到指定地图("雪拉威森塔９８层", 1)

等待(200)

自动寻路(120, 88)
自动寻路(116, 88)
自动寻路(116, 105)
自动寻路(83, 105)
自动寻路(83, 104)
自动寻路(76, 104)
自动寻路(75, 105)
自动寻路(72, 105)
自动寻路(68, 101)
自动寻路(68, 93)
自动寻路(72, 89)
自动寻路(96, 89)
自动寻路(100, 85)
自动寻路(100, 73)
自动寻路(129, 73)
自动寻路(132, 70)
自动寻路(132, 59)
自动寻路(130, 57)
自动寻路(120, 57)
自动寻路(116, 53)
自动寻路(116, 44)
自动寻路(113, 41)
自动寻路(104, 41)
自动寻路(96, 33)
自动寻路(90, 33)
自动寻路(85, 38)
自动寻路(85, 49)
自动寻路(84, 50)
自动寻路(84, 57)
自动寻路(72, 57)
自动寻路(69, 60)
自动寻路(69, 70)
自动寻路(66, 73)
自动寻路(52, 73)
自动寻路(52, 84)
自动寻路(47, 89)
自动寻路(36, 89)
自动寻路(32, 93)
自动寻路(32, 100)
自动寻路(37, 105)
自动寻路(49, 105)
自动寻路(52, 108)
自动寻路(52, 117)
自动寻路(56, 121)
自动寻路(56, 125)
自动寻路(68, 125)
自动寻路(72, 121)
自动寻路(72, 117)
自动寻路(85, 117)
自动寻路(89, 121)
自动寻路(99, 121)
自动寻路(99, 126)
自动寻路(100, 127)
自动寻路(100, 132)
自动寻路(95, 137)
自动寻路(73, 137)
自动寻路(69, 141)
自动寻路(69, 149)
自动寻路(87, 149)
自动寻路(87, 153)
自动寻路(97, 153)
自动寻路(100, 156)
自动寻路(100, 165)
自动寻路(112, 165)
自动寻路(112, 153)
自动寻路(116, 149)
自动寻路(116, 141)
自动寻路(120, 137)
自动寻路(134, 137)
自动寻路(138, 133)
自动寻路(144, 133)
自动寻路(144, 124)
自动寻路(148, 120)
自动寻路(148, 88)
自动寻路(145, 88)
自动寻路(144, 89)
自动寻路(132, 89)
自动寻路(132, 119)
自动寻路(126, 125)
自动寻路(120, 125)
自动寻路(120, 121)

等待(200)


转向(8, "")
等待服务器返回()

对话选择("32", "", "")

对话选择("4", "", "")
等待服务器返回()
对话选择("1", "", "")


等待到指定地图("雪拉威森塔９９层", 1)

等待(200)

回城()

等待到指定地图("艾尔莎岛", 1)

等待(200)



转向(1, "")
等待服务器返回()
对话选择("4", "", "")


等待到指定地图("里谢里雅堡", 1)

等待(200)


自动寻路(30, 82)
自动寻路(30, 90)
自动寻路(33, 90)
自动寻路(34, 89)


回复(1)


::wusi::

使用物品("伍斯的护身符")
等待服务器返回()
对话选择("4", "", "")

等待到指定地图("雪拉威森塔９８层", 1)

等待(200)


转向(8, "")
等待服务器返回()
对话选择("1", "", "")

等待到指定地图("雪拉威森塔９９层", 1)

等待(200)

自动寻路(113, 118)
自动寻路(113, 113)
自动寻路(119, 113)
自动寻路(119, 109)
自动寻路(108, 109)
自动寻路(108, 121)
自动寻路(104, 121)
自动寻路(104, 109)
自动寻路(100, 109)
自动寻路(100, 105)
自动寻路(108, 105)
自动寻路(108, 89)
自动寻路(104, 89)
自动寻路(104, 101)
自动寻路(100, 101)
自动寻路(100, 85)
自动寻路(88, 85)
自动寻路(88, 89)
自动寻路(96, 89)
自动寻路(96, 93)
自动寻路(84, 93)
自动寻路(84, 109)
自动寻路(96, 109)
自动寻路(96, 113)
自动寻路(100, 113)
自动寻路(100, 121)
自动寻路(96, 121)
自动寻路(96, 117)
自动寻路(92, 117)
自动寻路(92, 125)
自动寻路(88, 125)
自动寻路(88, 117)
自动寻路(81, 117)
自动寻路(81, 121)
自动寻路(70, 121)
自动寻路(69, 120)
自动寻路(67, 120)
自动寻路(66, 121)
自动寻路(57, 121)
自动寻路(52, 116)
自动寻路(52, 105)
自动寻路(38, 105)
自动寻路(36, 103)
自动寻路(36, 94)
自动寻路(40, 90)
自动寻路(41, 90)
自动寻路(41, 89)
自动寻路(51, 89)
自动寻路(51, 84)
自动寻路(52, 84)
自动寻路(52, 79)
自动寻路(57, 74)
自动寻路(57, 73)
自动寻路(62, 73)
自动寻路(66, 69)
自动寻路(68, 69)
自动寻路(68, 62)
自动寻路(73, 57)
自动寻路(99, 57)
自动寻路(101, 55)

等待(200)


转向(1, "")
等待服务器返回()
对话选择("4", "", "")
等待服务器返回()
对话选择("1", "", "")


等待到指定地图("雪拉威森塔最上层", 1)

等待(200)

回城()

等待到指定地图("艾尔莎岛", 1)

等待(200)



转向(1, "")
等待服务器返回()
对话选择("4", "", "")


等待到指定地图("里谢里雅堡", 1)

等待(200)


自动寻路(30, 82)
自动寻路(30, 90)
自动寻路(33, 90)
自动寻路(34, 89)


回复(1)


::nisi::

使用物品("尼斯的护身符")
等待服务器返回()
对话选择("4", "", "")

等待到指定地图("雪拉威森塔９９层", 1)

等待(200)


转向(2, "")
等待服务器返回()
对话选择("1", "", "")

等待到指定地图("雪拉威森塔最上层", 1)

等待(200)

自动寻路(104, 53)
自动寻路(100, 53)
自动寻路(100, 33)
自动寻路(96, 33)
自动寻路(96, 45)
自动寻路(92, 45)
自动寻路(92, 37)
自动寻路(84, 37)
自动寻路(84, 69)
自动寻路(80, 69)
自动寻路(80, 53)
自动寻路(76, 53)
自动寻路(76, 65)
自动寻路(72, 65)
自动寻路(72, 53)
自动寻路(68, 53)
自动寻路(68, 70)
自动寻路(69, 70)
自动寻路(69, 81)
自动寻路(68, 82)
自动寻路(68, 85)
自动寻路(72, 89)
自动寻路(83, 89)
自动寻路(83, 88)
自动寻路(85, 88)
自动寻路(85, 89)
自动寻路(96, 89)
自动寻路(100, 85)
自动寻路(100, 77)
自动寻路(104, 73)
自动寻路(112, 73)
自动寻路(116, 69)
自动寻路(116, 62)
自动寻路(121, 57)
自动寻路(132, 57)
自动寻路(132, 87)
自动寻路(130, 89)
自动寻路(120, 89)
自动寻路(116, 93)
自动寻路(116, 103)
自动寻路(114, 105)
自动寻路(103, 105)
自动寻路(103, 104)
自动寻路(101, 104)
自动寻路(101, 105)
自动寻路(87, 105)
自动寻路(87, 104)
自动寻路(85, 104)
自动寻路(85, 105)
自动寻路(52, 105)
自动寻路(52, 92)
自动寻路(49, 89)
自动寻路(36, 89)
自动寻路(36, 107)
自动寻路(40, 107)
自动寻路(40, 117)
自动寻路(52, 117)
自动寻路(56, 121)
自动寻路(56, 124)
自动寻路(70, 124)
自动寻路(73, 121)
自动寻路(132, 121)
自动寻路(132, 109)
自动寻路(136, 105)
自动寻路(144, 105)
自动寻路(148, 101)
自动寻路(148, 93)
自动寻路(152, 89)
自动寻路(164, 89)
自动寻路(164, 105)
自动寻路(160, 109)
自动寻路(160, 117)
自动寻路(145, 117)
自动寻路(145, 132)
自动寻路(134, 132)
自动寻路(129, 137)
自动寻路(120, 137)
自动寻路(116, 141)
自动寻路(116, 154)
自动寻路(112, 158)
自动寻路(112, 164)
自动寻路(100, 164)
自动寻路(100, 139)
自动寻路(103, 136)
自动寻路(103, 134)

等待到指定地图("雪拉威森塔前庭", 1)

等待(200)

自动寻路(101, 21)
自动寻路(103, 19)

等待(300)
::wanguan::
等待(300)

喊话("男",0v2,03,04)
等待服务器返回()
对话选择("1", "", "")
goto dengdai 

::dengdai::
等待到指定地图("国民会馆", 1)

等待(200)
if(取物品数量("王冠") > 0)then goto  qucun end

goto kaishi 


::qucun::
   回城()
   等待到指定地图("艾尔莎岛", 1)
   等待(500)
   
   自动寻路(146, 105)
   自动寻路(157, 94)
   转向(1, "")
   
   等待到指定地图("艾夏岛", 1)
   等待(200)
   
   自动寻路(88, 112)
   自动寻路(94, 118)
   自动寻路(101, 118)
   自动寻路(114, 105)
   自动寻路(114, 104)
   
   等待到指定地图("银行", 1)
   等待(200)
   
   自动寻路(27, 25)
   自动寻路(49, 25)
   
::cun::
   等待(200)
   
   转向(2, "")
   等待服务器返回()
   对话选择("存条", "王冠", "")
   
   等待(500)
   
   goto kaishi 