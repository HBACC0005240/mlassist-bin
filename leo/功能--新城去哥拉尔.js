require(process.env.CGA_DIR_PATH_UTF8+'/leo').then(async (cga) => {
    leo.log('红叶の新城去哥拉尔脚本，启动~');
    leo.goto(n=>n.grahl.c)
    .then(()=>leo.log('已经到达哥拉尔'));
});