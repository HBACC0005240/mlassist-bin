require(process['\x65\x6e\x76']['\x43\x47\x41\x5f\x44\x49\x52\x5f\x50\x41\x54\x48\x5f\x55\x54\x46\x38'] + '\x2f\x6c\x65\x6f')['\x74\x68\x65\x6e'](async 红叶の脚本 => {
    leo.monitor.config.keepAlive = false;   //关闭防掉线
    var 队伍设置 = [
		['红叶战队01', '红叶战队02', '红叶战队03', '红叶战队04', '红叶战队05'], 
		['单人队长名字01'], 
		['单人队长名字02']
	], 
	医生 = '医道之殇',
    水晶 = '水火的水晶（5：5）',
    是否自动加载配置 = true,
    银行大小 = 20,
    补给百分比 = 0.6,
    启动是否先登出 = false;
	
    const _0x1aa038 = {
        '\x74\x65\x61\x6d\x73': 队伍设置,
        '\x64\x6f\x63\x74\x6f\x72\x4e\x61\x6d\x65': 医生,
        '\x63\x72\x79\x73\x74\x61\x6c\x4e\x61\x6d\x65': 水晶,
        '\x69\x73\x4c\x6f\x61\x64\x4a\x73\x6f\x6e': 是否自动加载配置,
        '\x62\x61\x6e\x6b\x53\x69\x7a\x65': 银行大小,
        '\x73\x75\x70\x70\x6c\x79\x52\x61\x74\x65': 补给百分比,
        '\x69\x73\x4c\x6f\x67\x42\x61\x63\x6b\x46\x69\x72\x73\x74': 启动是否先登出
    };
    return leo['\x70\x6c\x75\x67\x69\x6e\x73']['\x6c\x6f\x61\x64']['\x73\x74\x61\x72\x74'](_0x1aa038);
});