# SJNumTabDmeo

导入UIButton+SJTab，实例化btn调用sj_**属性

此处仅以UIButton的category为例写的，其他很多控件都可实现

## 使用：

1. 实例化UIButton *btn = [UIButton buttonWithType:0];

2. btn.sj_tabUserInteractionEnabled 是否开启角标操作（默认不开启操作）

3. btn.sj_tabNum(替换sj_numTabStr) 角标数量（角标数量为0时自动释放）

4. btn.sj_rightOfSet 角标与右边距（角标默认位置右上角）

5. btn.sj_topOfSet 角标与上边距（角标默认位置右上角）

6. btn.sj_backColor 角标背景颜色（默认颜色红色）

7. btn.sj_numColor 角标字体颜色（默认颜色白色）

实现内容参考 https://github.com/ZhongTaoTian/QQBtn

图片度娘找的。。。将就将就，还不会弄GIF图，类似这种效果
![](http://images.macx.cn/forum/201412/21/122036mpamaajzxqx1v8t0.gif)  
