# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: CGData.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x0c\x43GData.proto\x12\x06\x43GData\" \n\x10\x43GGmeTypeRequest\x12\x0c\n\x04type\x18\x01 \x01(\x05\"\x1a\n\tStringPub\x12\r\n\x05value\x18\x01 \x01(\t\"\xa8\x01\n\x18UploadGidBankDataRequest\x12\x0b\n\x03gid\x18\x01 \x01(\t\x12\x16\n\x0e\x63haracter_name\x18\x02 \x01(\t\x12\x0c\n\x04gold\x18\x03 \x01(\x05\x12#\n\x08pet_data\x18\x04 \x03(\x0b\x32\x11.CGData.CGPetData\x12!\n\x05items\x18\x05 \x03(\x0b\x32\x12.CGData.CGItemData\x12\x11\n\trole_type\x18\x06 \x01(\x05\"r\n\x14UploadMapDataRequest\x12\x10\n\x08\x46ileName\x18\x01 \x01(\t\x12\x12\n\nServerLine\x18\x02 \x01(\t\x12\x0f\n\x07MapType\x18\x03 \x01(\t\x12\x10\n\x08\x66ileTime\x18\x04 \x01(\t\x12\x11\n\tImageData\x18\x05 \x01(\x0c\"\x17\n\x15UploadMapDataResponse\"O\n\x16\x44ownloadMapDataRequest\x12\x10\n\x08\x46ileName\x18\x01 \x01(\t\x12\x12\n\nServerLine\x18\x02 \x01(\t\x12\x0f\n\x07MapType\x18\x03 \x01(\t\"u\n\x17\x44ownloadMapDataResponse\x12\x10\n\x08\x46ileName\x18\x01 \x01(\t\x12\x12\n\nServerLine\x18\x02 \x01(\t\x12\x0f\n\x07MapType\x18\x03 \x01(\t\x12\x10\n\x08\x66ileTime\x18\x04 \x01(\t\x12\x11\n\tImageData\x18\x05 \x01(\x0c\"\x7f\n\x10\x43GAccountGidData\x12\x0f\n\x07\x61\x63\x63ount\x18\x01 \x01(\t\x12\x0b\n\x03gid\x18\x02 \x01(\t\x12\x11\n\tgame_type\x18\x03 \x01(\x05\x12\x12\n\nbig_server\x18\x04 \x01(\x05\x12\x13\n\x0bserver_line\x18\x05 \x01(\r\x12\x11\n\tcharacter\x18\x06 \x01(\x05\"\xc7\x01\n\x14UploadGidDataRequest\x12\x0b\n\x03gid\x18\x01 \x01(\t\x12\x16\n\x0e\x63haracter_name\x18\x02 \x01(\t\x12/\n\x0e\x63haracter_data\x18\x03 \x01(\x0b\x32\x17.CGData.CGCharacterData\x12#\n\x08pet_data\x18\x04 \x03(\x0b\x32\x11.CGData.CGPetData\x12!\n\x05items\x18\x05 \x03(\x0b\x32\x12.CGData.CGItemData\x12\x11\n\trole_type\x18\x06 \x01(\x05\".\n\x1bSelectAccountGidDataRequest\x12\x0f\n\x07\x61\x63\x63ount\x18\x01 \x01(\t\"6\n\x14SelectGidDataRequest\x12\x0b\n\x03gid\x18\x01 \x01(\t\x12\x11\n\trole_type\x18\x02 \x01(\x05\"A\n\x1aSelectCharacterDataRequest\x12\x11\n\tchar_name\x18\x01 \x01(\t\x12\x10\n\x08\x62ig_line\x18\x02 \x01(\x05\"\xc0\x01\n\x1bSelectCharacterDataResponse\x12\x16\n\x0e\x63haracter_name\x18\x01 \x01(\t\x12\x10\n\x08\x62ig_line\x18\x02 \x01(\x05\x12/\n\x0e\x63haracter_data\x18\x03 \x01(\x0b\x32\x17.CGData.CGCharacterData\x12#\n\x08pet_data\x18\x04 \x03(\x0b\x32\x11.CGData.CGPetData\x12!\n\x05items\x18\x05 \x03(\x0b\x32\x12.CGData.CGItemData\"C\n\x1cSelectCharacterServerRequest\x12\x11\n\tchar_name\x18\x01 \x01(\t\x12\x10\n\x08\x62ig_line\x18\x02 \x01(\x05\"n\n\x1dSelectCharacterServerResponse\x12\x11\n\tchar_name\x18\x01 \x01(\t\x12\x10\n\x08\x62ig_line\x18\x02 \x01(\x05\x12\n\n\x02ip\x18\x03 \x01(\t\x12\x0c\n\x04port\x18\x04 \x01(\x05\x12\x0e\n\x06online\x18\x05 \x01(\x05\"<\n\x15SelectTaskInfoRequest\x12\x11\n\ttask_name\x18\x01 \x01(\t\x12\x10\n\x08\x62ig_line\x18\x02 \x01(\x05\"\xdd\x01\n\x16SelectTaskInfoResponse\x12\x11\n\ttask_name\x18\x01 \x01(\t\x12\x10\n\x08\x62ig_line\x18\x02 \x01(\x05\x12\x0c\n\x04line\x18\x03 \x01(\x05\x12\x11\n\tnpc_pos_x\x18\x04 \x01(\x05\x12\x11\n\tnpc_pos_y\x18\x05 \x01(\x05\x12\x11\n\tlast_time\x18\x06 \x01(\x05\x12\x1a\n\x12last_map_first_num\x18\x07 \x01(\x05\x12\x1c\n\x14last_map_first_width\x18\x08 \x01(\x05\x12\x1d\n\x15last_map_first_height\x18\t \x01(\x05\"N\n\x1cSelectAccountGidDataResponse\x12.\n\x07gidData\x18\x01 \x03(\x0b\x32\x1d.CGData.SelectGidDataResponse\"\xc8\x01\n\x15SelectGidDataResponse\x12\x0b\n\x03gid\x18\x01 \x01(\t\x12\x11\n\trole_type\x18\x02 \x01(\x05\x12\x16\n\x0e\x63haracter_name\x18\x03 \x01(\t\x12/\n\x0e\x63haracter_data\x18\x04 \x01(\x0b\x32\x17.CGData.CGCharacterData\x12#\n\x08pet_data\x18\x05 \x03(\x0b\x32\x11.CGData.CGPetData\x12!\n\x05items\x18\x06 \x03(\x0b\x32\x12.CGData.CGItemData\"\x8a\x01\n\nCGBaseData\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\n\n\x02hp\x18\x02 \x01(\x05\x12\n\n\x02mp\x18\x03 \x01(\x05\x12\r\n\x05maxhp\x18\x04 \x01(\x05\x12\r\n\x05maxmp\x18\x05 \x01(\x05\x12\r\n\x05level\x18\x06 \x01(\x05\x12\n\n\x02xp\x18\x07 \x01(\x05\x12\r\n\x05maxxp\x18\x08 \x01(\x05\x12\x0e\n\x06health\x18\t \x01(\x05\"\xe0\x01\n\x0f\x43GSkillBaseData\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x0c\n\x04info\x18\x02 \x01(\t\x12\n\n\x02id\x18\x03 \x01(\x05\x12\x0c\n\x04\x63ost\x18\x04 \x01(\x05\x12\r\n\x05\x66lags\x18\x05 \x01(\x05\x12\r\n\x05index\x18\x06 \x01(\x05\x12\r\n\x05level\x18\x07 \x01(\x05\x12\x10\n\x08maxLevel\x18\x08 \x01(\x05\x12\x11\n\tavailable\x18\t \x01(\x08\x12\n\n\x02xp\x18\n \x01(\x05\x12\r\n\x05maxxp\x18\x0b \x01(\x05\x12*\n\tsubskills\x18\x0c \x03(\x0b\x32\x17.CGData.CGSkillBaseData\"\xcf\x04\n\x0e\x43GAttrBaseData\x12\x15\n\rpoints_remain\x18\x01 \x01(\x05\x12\x18\n\x10points_endurance\x18\x02 \x01(\x05\x12\x17\n\x0fpoints_strength\x18\x03 \x01(\x05\x12\x16\n\x0epoints_defense\x18\x04 \x01(\x05\x12\x16\n\x0epoints_agility\x18\x05 \x01(\x05\x12\x16\n\x0epoints_magical\x18\x06 \x01(\x05\x12\x14\n\x0cvalue_attack\x18\x07 \x01(\x05\x12\x17\n\x0fvalue_defensive\x18\x08 \x01(\x05\x12\x15\n\rvalue_agility\x18\t \x01(\x05\x12\x14\n\x0cvalue_spirit\x18\n \x01(\x05\x12\x16\n\x0evalue_recovery\x18\x0b \x01(\x05\x12\x15\n\rresist_poison\x18\x0c \x01(\x05\x12\x14\n\x0cresist_sleep\x18\r \x01(\x05\x12\x15\n\rresist_medusa\x18\x0e \x01(\x05\x12\x14\n\x0cresist_drunk\x18\x0f \x01(\x05\x12\x14\n\x0cresist_chaos\x18\x10 \x01(\x05\x12\x15\n\rresist_forget\x18\x11 \x01(\x05\x12\x14\n\x0c\x66ix_critical\x18\x12 \x01(\x05\x12\x16\n\x0e\x66ix_strikeback\x18\x13 \x01(\x05\x12\x15\n\rfix_accurancy\x18\x14 \x01(\x05\x12\x11\n\tfix_dodge\x18\x15 \x01(\x05\x12\x15\n\relement_earth\x18\x16 \x01(\x05\x12\x15\n\relement_water\x18\x17 \x01(\x05\x12\x14\n\x0c\x65lement_fire\x18\x18 \x01(\x05\x12\x14\n\x0c\x65lement_wind\x18\x19 \x01(\x05\"\xad\x01\n\x13\x43GCharacterPersDesc\x12\x12\n\nchangeBits\x18\x01 \x01(\x05\x12\x10\n\x08sellIcon\x18\x02 \x01(\x05\x12\x12\n\nsellString\x18\x03 \x01(\t\x12\x0f\n\x07\x62uyIcon\x18\x04 \x01(\x05\x12\x11\n\tbuyString\x18\x05 \x01(\t\x12\x10\n\x08wantIcon\x18\x06 \x01(\x05\x12\x12\n\nwantString\x18\x07 \x01(\t\x12\x12\n\ndescString\x18\x08 \x01(\t\"\xdf\x05\n\x0f\x43GCharacterData\x12%\n\tbase_data\x18\x01 \x01(\x0b\x32\x12.CGData.CGBaseData\x12\r\n\x05souls\x18\x02 \x01(\x05\x12\r\n\x05level\x18\x03 \x01(\x05\x12\x0c\n\x04gold\x18\x04 \x01(\x05\x12\x10\n\x08image_id\x18\x05 \x01(\x05\x12\r\n\x05score\x18\x06 \x01(\x05\x12\x12\n\nskillslots\x18\x07 \x01(\x05\x12\x11\n\tuse_title\x18\x08 \x01(\x05\x12\x11\n\tavatar_id\x18\t \x01(\x05\x12\x0e\n\x06unitid\x18\n \x01(\x05\x12\r\n\x05petid\x18\x0b \x01(\x05\x12\x11\n\tpetriding\x18\x0c \x01(\x08\x12\x11\n\tdirection\x18\r \x01(\x05\x12\x12\n\npunchclock\x18\x0e \x01(\x05\x12\x17\n\x0fusingpunchclock\x18\x0f \x01(\x08\x12\x0b\n\x03job\x18\x10 \x01(\t\x12\x0e\n\x06titles\x18\x11 \x03(\t\x12\x16\n\x0emanu_endurance\x18\x12 \x01(\x05\x12\x15\n\rmanu_skillful\x18\x13 \x01(\x05\x12\x19\n\x11manu_intelligence\x18\x14 \x01(\x05\x12\x16\n\x0evalue_charisma\x18\x15 \x01(\x05\x12\t\n\x01x\x18\x16 \x01(\x05\x12\t\n\x01y\x18\x17 \x01(\x05\x12\x10\n\x08map_name\x18\x18 \x01(\t\x12\x12\n\nmap_number\x18\x19 \x01(\x05\x12\x13\n\x0bserver_line\x18\x1a \x01(\x05\x12&\n\x06\x64\x65tail\x18\x1b \x01(\x0b\x32\x16.CGData.CGAttrBaseData\x12&\n\x05skill\x18\x1c \x03(\x0b\x32\x17.CGData.CGSkillBaseData\x12\x0c\n\x04nick\x18\x1d \x01(\t\x12.\n\tpers_desc\x18\x1e \x01(\x0b\x32\x1b.CGData.CGCharacterPersDesc\x12\x17\n\x0f\x62\x61ttle_position\x18\x1f \x01(\x05\x12\x11\n\tbank_gold\x18  \x01(\x05\x12\x15\n\x08\x62ig_line\x18! \x01(\x05H\x00\x88\x01\x01\x42\x0b\n\t_big_line\"\xdf\x02\n\tCGPetData\x12%\n\tbase_data\x18\x01 \x01(\x0b\x32\x12.CGData.CGBaseData\x12\r\n\x05index\x18\x02 \x01(\x05\x12\r\n\x05\x66lags\x18\x03 \x01(\x05\x12\x14\n\x0c\x62\x61ttle_flags\x18\x04 \x01(\x05\x12\x10\n\x08loyality\x18\x05 \x01(\x05\x12\x16\n\x0e\x64\x65\x66\x61ult_battle\x18\x06 \x01(\x08\x12\r\n\x05state\x18\x07 \x01(\x05\x12\r\n\x05grade\x18\x08 \x01(\x05\x12\x14\n\x0clossMinGrade\x18\t \x01(\x05\x12\x14\n\x0clossMaxGrade\x18\n \x01(\x05\x12&\n\x05skill\x18\x0b \x03(\x0b\x32\x17.CGData.CGSkillBaseData\x12&\n\x06\x64\x65tail\x18\x0c \x01(\x0b\x32\x16.CGData.CGAttrBaseData\x12\x11\n\treal_name\x18\r \x01(\t\x12\x0c\n\x04race\x18\x0e \x01(\x05\x12\x12\n\nskillslots\x18\x0f \x01(\x05\"\xa4\x01\n\nCGItemData\x12\x10\n\x08image_id\x18\x01 \x01(\x05\x12\x0f\n\x07item_id\x18\x02 \x01(\x05\x12\x0c\n\x04name\x18\x03 \x01(\t\x12\x0c\n\x04type\x18\x04 \x01(\x05\x12\r\n\x05level\x18\x05 \x01(\x05\x12\x0c\n\x04\x61ttr\x18\x06 \x01(\t\x12\x0c\n\x04info\x18\x07 \x01(\t\x12\x0b\n\x03pos\x18\x08 \x01(\x05\x12\x10\n\x08\x61ssessed\x18\t \x01(\x08\x12\r\n\x05\x63ount\x18\n \x01(\x05\"\x17\n\x15UploadGidDataResponse\"\x1b\n\x19UploadGidBankDataResponse\"9\n\x11\x43GStoreMapRequest\x12\x12\n\nmap_number\x18\x01 \x01(\x05\x12\x10\n\x08map_name\x18\x02 \x01(\t\"\x14\n\x12\x43GStoreMapResponse\"\x12\n\x10\x43GMapDataRequest\"4\n\x11\x43GMapDataResponse\x12\x1f\n\x04maps\x18\x01 \x03(\x0b\x32\x11.CGData.CGMapData\"Z\n\tCGMapData\x12\n\n\x02id\x18\x01 \x01(\x04\x12\x12\n\nmap_number\x18\x02 \x01(\x05\x12\x10\n\x08map_name\x18\x03 \x01(\t\x12\x0c\n\x04\x64\x65sc\x18\x04 \x01(\t\x12\r\n\x05often\x18\x05 \x01(\x05\"\x17\n\x15\x43GPetGradeCalcRequest\"A\n\x16\x43GPetGradeCalcResponse\x12\'\n\x03pet\x18\x01 \x03(\x0b\x32\x1a.CGData.CGPetGradeCalcData\"\xb7\x03\n\x12\x43GPetGradeCalcData\x12\n\n\x02id\x18\x01 \x01(\x04\x12\x0e\n\x06number\x18\x02 \x01(\x05\x12\x0c\n\x04name\x18\x03 \x01(\t\x12\x10\n\x08raceType\x18\x04 \x01(\x05\x12\x14\n\x0craceTypeName\x18\x05 \x01(\t\x12\x0e\n\x06\x62\x61seBP\x18\x06 \x01(\x01\x12\x12\n\ntotalGrade\x18\x07 \x01(\x05\x12\x13\n\x0b\x62\x65stBPGrade\x18\x08 \x03(\x01\x12\x11\n\tcan_catch\x18\t \x01(\x05\x12\x11\n\tcard_type\x18\n \x01(\x05\x12\x10\n\x08image_id\x18\x0b \x01(\x05\x12\x16\n\x0erate_endurance\x18\x0c \x01(\x05\x12\x15\n\rrate_strength\x18\r \x01(\x05\x12\x14\n\x0crate_defense\x18\x0e \x01(\x05\x12\x14\n\x0crate_agility\x18\x0f \x01(\x05\x12\x14\n\x0crate_magical\x18\x10 \x01(\x05\x12\x15\n\relement_earth\x18\x11 \x01(\x05\x12\x15\n\relement_water\x18\x12 \x01(\x05\x12\x14\n\x0c\x65lement_fire\x18\x13 \x01(\x05\x12\x14\n\x0c\x65lement_wind\x18\x14 \x01(\x05\x12\x13\n\x0bskill_slots\x18\x15 \x01(\x05\" \n\rCGItemRequest\x12\x0f\n\x07item_id\x18\x01 \x01(\x05\"\xc0\x01\n\x0e\x43GItemResponse\x12\n\n\x02id\x18\x01 \x01(\x04\x12\x0f\n\x07item_id\x18\x02 \x01(\x05\x12\x0c\n\x04name\x18\x03 \x01(\t\x12\x0c\n\x04type\x18\x04 \x01(\x05\x12\r\n\x05price\x18\x05 \x01(\x05\x12\x0f\n\x07maxpile\x18\x06 \x01(\x05\x12\r\n\x05level\x18\x07 \x01(\x05\x12\x16\n\x0esellLimitCount\x18\x08 \x01(\x05\x12\x11\n\tattribute\x18\t \x01(\t\x12\x0c\n\x04\x64\x65sc\x18\n \x01(\t\x12\r\n\x05\x65xist\x18\x0b \x01(\x08\"\xbb\x01\n\x12\x43GStoreItemRequest\x12\x0f\n\x07item_id\x18\x01 \x01(\x05\x12\x0c\n\x04name\x18\x02 \x01(\t\x12\x0c\n\x04type\x18\x03 \x01(\x05\x12\r\n\x05price\x18\x04 \x01(\x05\x12\x0f\n\x07maxpile\x18\x05 \x01(\x05\x12\r\n\x05level\x18\x06 \x01(\x05\x12\x16\n\x0esellLimitCount\x18\x07 \x01(\x05\x12\x11\n\tattribute\x18\x08 \x01(\t\x12\x0c\n\x04\x64\x65sc\x18\t \x01(\t\x12\x10\n\x08\x61ssessed\x18\n \x01(\x08\"4\n\x13\x43GStoreItemResponse\x12\n\n\x02id\x18\x01 \x01(\x05\x12\x11\n\tmaybeName\x18\x02 \x01(\t\"\x0c\n\nCGVoidData\"\x19\n\nCGBoolData\x12\x0b\n\x03val\x18\x01 \x01(\x08\"\x18\n\tCGIntData\x12\x0b\n\x03val\x18\x01 \x01(\x05\"\x93\x01\n\x11\x43GSysTimeResponse\x12\r\n\x05years\x18\x01 \x01(\x05\x12\r\n\x05month\x18\x02 \x01(\x05\x12\x0c\n\x04\x64\x61ys\x18\x03 \x01(\x05\x12\r\n\x05hours\x18\x04 \x01(\x05\x12\x0c\n\x04mins\x18\x05 \x01(\x05\x12\x0c\n\x04secs\x18\x06 \x01(\x05\x12\x12\n\nlocal_time\x18\x07 \x01(\x05\x12\x13\n\x0bserver_time\x18\x08 \x01(\x05\"8\n\x17\x43GPlayerFlagEnabledData\x12\r\n\x05index\x18\x01 \x01(\x05\x12\x0e\n\x06\x65nable\x18\x02 \x01(\x08\x32\x9f\x04\n\x0cMLRpcService\x12:\n\nInitialize\x12\x18.CGData.CGGmeTypeRequest\x1a\x12.CGData.CGVoidData\x12\x31\n\x07\x43onnect\x12\x12.CGData.CGVoidData\x1a\x12.CGData.CGBoolData\x12\x31\n\x08IsInGame\x12\x12.CGData.CGVoidData\x1a\x11.CGData.CGIntData\x12\x37\n\x0eGetWorldStatus\x12\x12.CGData.CGVoidData\x1a\x11.CGData.CGIntData\x12\x36\n\rGetGameStatus\x12\x12.CGData.CGVoidData\x1a\x11.CGData.CGIntData\x12\x34\n\x0bGetBGMIndex\x12\x12.CGData.CGVoidData\x1a\x11.CGData.CGIntData\x12;\n\nGetSysTime\x12\x12.CGData.CGVoidData\x1a\x19.CGData.CGSysTimeResponse\x12<\n\rGetPlayerInfo\x12\x12.CGData.CGVoidData\x1a\x17.CGData.CGCharacterData\x12K\n\x14SetPlayerFlagEnabled\x12\x1f.CGData.CGPlayerFlagEnabledData\x1a\x12.CGData.CGVoidData2\x8b\x0c\n\x0c\x43GRpcService\x12>\n\rGetCGItemData\x12\x15.CGData.CGItemRequest\x1a\x16.CGData.CGItemResponse\x12\x39\n\x0fGetConnectState\x12\x12.CGData.CGVoidData\x1a\x12.CGData.CGVoidData\x12V\n\x13GetPetGradeCalcData\x12\x1d.CGData.CGPetGradeCalcRequest\x1a\x1e.CGData.CGPetGradeCalcResponse\"\x00\x12N\n\x15GetServerStoreMapData\x12\x18.CGData.CGMapDataRequest\x1a\x19.CGData.CGMapDataResponse\"\x00\x12L\n\x0fStoreCGItemData\x12\x1a.CGData.CGStoreItemRequest\x1a\x1b.CGData.CGStoreItemResponse\"\x00\x12I\n\x0eStoreCGMapData\x12\x19.CGData.CGStoreMapRequest\x1a\x1a.CGData.CGStoreMapResponse\"\x00\x12N\n\rUploadGidData\x12\x1c.CGData.UploadGidDataRequest\x1a\x1d.CGData.UploadGidDataResponse\"\x00\x12Z\n\x11UploadGidBankData\x12 .CGData.UploadGidBankDataRequest\x1a!.CGData.UploadGidBankDataResponse\"\x00\x12P\n\rUploadMapData\x12\x1c.CGData.UploadMapDataRequest\x1a\x1d.CGData.UploadMapDataResponse\"\x00(\x01\x12V\n\x0f\x44ownloadMapData\x12\x1e.CGData.DownloadMapDataRequest\x1a\x1f.CGData.DownloadMapDataResponse\"\x00\x30\x01\x12S\n\x14UploadCharcterServer\x12%.CGData.SelectCharacterServerResponse\x1a\x12.CGData.CGVoidData\"\x00\x12/\n\x07Publish\x12\x11.CGData.StringPub\x1a\x11.CGData.StringPub\x12\x33\n\tSubscribe\x12\x11.CGData.StringPub\x1a\x11.CGData.StringPub0\x01\x12\x63\n\x14SelectAccountGidData\x12#.CGData.SelectAccountGidDataRequest\x1a$.CGData.SelectAccountGidDataResponse\"\x00\x12N\n\rSelectGidData\x12\x1c.CGData.SelectGidDataRequest\x1a\x1d.CGData.SelectGidDataResponse\"\x00\x12\\\n\x14SelectDstTypeGidData\x12\x1c.CGData.SelectGidDataRequest\x1a$.CGData.SelectAccountGidDataResponse\"\x00\x12\x66\n\x15SelectCharacterServer\x12$.CGData.SelectCharacterServerRequest\x1a%.CGData.SelectCharacterServerResponse\"\x00\x12Q\n\x0eSelectTaskInfo\x12\x1d.CGData.SelectTaskInfoRequest\x1a\x1e.CGData.SelectTaskInfoResponse\"\x00\x12`\n\x13SelectCharacterData\x12\".CGData.SelectCharacterDataRequest\x1a#.CGData.SelectCharacterDataResponse\"\x00\x62\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'CGData_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _globals['_CGGMETYPEREQUEST']._serialized_start=24
  _globals['_CGGMETYPEREQUEST']._serialized_end=56
  _globals['_STRINGPUB']._serialized_start=58
  _globals['_STRINGPUB']._serialized_end=84
  _globals['_UPLOADGIDBANKDATAREQUEST']._serialized_start=87
  _globals['_UPLOADGIDBANKDATAREQUEST']._serialized_end=255
  _globals['_UPLOADMAPDATAREQUEST']._serialized_start=257
  _globals['_UPLOADMAPDATAREQUEST']._serialized_end=371
  _globals['_UPLOADMAPDATARESPONSE']._serialized_start=373
  _globals['_UPLOADMAPDATARESPONSE']._serialized_end=396
  _globals['_DOWNLOADMAPDATAREQUEST']._serialized_start=398
  _globals['_DOWNLOADMAPDATAREQUEST']._serialized_end=477
  _globals['_DOWNLOADMAPDATARESPONSE']._serialized_start=479
  _globals['_DOWNLOADMAPDATARESPONSE']._serialized_end=596
  _globals['_CGACCOUNTGIDDATA']._serialized_start=598
  _globals['_CGACCOUNTGIDDATA']._serialized_end=725
  _globals['_UPLOADGIDDATAREQUEST']._serialized_start=728
  _globals['_UPLOADGIDDATAREQUEST']._serialized_end=927
  _globals['_SELECTACCOUNTGIDDATAREQUEST']._serialized_start=929
  _globals['_SELECTACCOUNTGIDDATAREQUEST']._serialized_end=975
  _globals['_SELECTGIDDATAREQUEST']._serialized_start=977
  _globals['_SELECTGIDDATAREQUEST']._serialized_end=1031
  _globals['_SELECTCHARACTERDATAREQUEST']._serialized_start=1033
  _globals['_SELECTCHARACTERDATAREQUEST']._serialized_end=1098
  _globals['_SELECTCHARACTERDATARESPONSE']._serialized_start=1101
  _globals['_SELECTCHARACTERDATARESPONSE']._serialized_end=1293
  _globals['_SELECTCHARACTERSERVERREQUEST']._serialized_start=1295
  _globals['_SELECTCHARACTERSERVERREQUEST']._serialized_end=1362
  _globals['_SELECTCHARACTERSERVERRESPONSE']._serialized_start=1364
  _globals['_SELECTCHARACTERSERVERRESPONSE']._serialized_end=1474
  _globals['_SELECTTASKINFOREQUEST']._serialized_start=1476
  _globals['_SELECTTASKINFOREQUEST']._serialized_end=1536
  _globals['_SELECTTASKINFORESPONSE']._serialized_start=1539
  _globals['_SELECTTASKINFORESPONSE']._serialized_end=1760
  _globals['_SELECTACCOUNTGIDDATARESPONSE']._serialized_start=1762
  _globals['_SELECTACCOUNTGIDDATARESPONSE']._serialized_end=1840
  _globals['_SELECTGIDDATARESPONSE']._serialized_start=1843
  _globals['_SELECTGIDDATARESPONSE']._serialized_end=2043
  _globals['_CGBASEDATA']._serialized_start=2046
  _globals['_CGBASEDATA']._serialized_end=2184
  _globals['_CGSKILLBASEDATA']._serialized_start=2187
  _globals['_CGSKILLBASEDATA']._serialized_end=2411
  _globals['_CGATTRBASEDATA']._serialized_start=2414
  _globals['_CGATTRBASEDATA']._serialized_end=3005
  _globals['_CGCHARACTERPERSDESC']._serialized_start=3008
  _globals['_CGCHARACTERPERSDESC']._serialized_end=3181
  _globals['_CGCHARACTERDATA']._serialized_start=3184
  _globals['_CGCHARACTERDATA']._serialized_end=3919
  _globals['_CGPETDATA']._serialized_start=3922
  _globals['_CGPETDATA']._serialized_end=4273
  _globals['_CGITEMDATA']._serialized_start=4276
  _globals['_CGITEMDATA']._serialized_end=4440
  _globals['_UPLOADGIDDATARESPONSE']._serialized_start=4442
  _globals['_UPLOADGIDDATARESPONSE']._serialized_end=4465
  _globals['_UPLOADGIDBANKDATARESPONSE']._serialized_start=4467
  _globals['_UPLOADGIDBANKDATARESPONSE']._serialized_end=4494
  _globals['_CGSTOREMAPREQUEST']._serialized_start=4496
  _globals['_CGSTOREMAPREQUEST']._serialized_end=4553
  _globals['_CGSTOREMAPRESPONSE']._serialized_start=4555
  _globals['_CGSTOREMAPRESPONSE']._serialized_end=4575
  _globals['_CGMAPDATAREQUEST']._serialized_start=4577
  _globals['_CGMAPDATAREQUEST']._serialized_end=4595
  _globals['_CGMAPDATARESPONSE']._serialized_start=4597
  _globals['_CGMAPDATARESPONSE']._serialized_end=4649
  _globals['_CGMAPDATA']._serialized_start=4651
  _globals['_CGMAPDATA']._serialized_end=4741
  _globals['_CGPETGRADECALCREQUEST']._serialized_start=4743
  _globals['_CGPETGRADECALCREQUEST']._serialized_end=4766
  _globals['_CGPETGRADECALCRESPONSE']._serialized_start=4768
  _globals['_CGPETGRADECALCRESPONSE']._serialized_end=4833
  _globals['_CGPETGRADECALCDATA']._serialized_start=4836
  _globals['_CGPETGRADECALCDATA']._serialized_end=5275
  _globals['_CGITEMREQUEST']._serialized_start=5277
  _globals['_CGITEMREQUEST']._serialized_end=5309
  _globals['_CGITEMRESPONSE']._serialized_start=5312
  _globals['_CGITEMRESPONSE']._serialized_end=5504
  _globals['_CGSTOREITEMREQUEST']._serialized_start=5507
  _globals['_CGSTOREITEMREQUEST']._serialized_end=5694
  _globals['_CGSTOREITEMRESPONSE']._serialized_start=5696
  _globals['_CGSTOREITEMRESPONSE']._serialized_end=5748
  _globals['_CGVOIDDATA']._serialized_start=5750
  _globals['_CGVOIDDATA']._serialized_end=5762
  _globals['_CGBOOLDATA']._serialized_start=5764
  _globals['_CGBOOLDATA']._serialized_end=5789
  _globals['_CGINTDATA']._serialized_start=5791
  _globals['_CGINTDATA']._serialized_end=5815
  _globals['_CGSYSTIMERESPONSE']._serialized_start=5818
  _globals['_CGSYSTIMERESPONSE']._serialized_end=5965
  _globals['_CGPLAYERFLAGENABLEDDATA']._serialized_start=5967
  _globals['_CGPLAYERFLAGENABLEDDATA']._serialized_end=6023
  _globals['_MLRPCSERVICE']._serialized_start=6026
  _globals['_MLRPCSERVICE']._serialized_end=6569
  _globals['_CGRPCSERVICE']._serialized_start=6572
  _globals['_CGRPCSERVICE']._serialized_end=8119
# @@protoc_insertion_point(module_scope)