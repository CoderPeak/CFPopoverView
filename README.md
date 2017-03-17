# CFPopoverView
只需要在创建的时候 传个位置 选择项的字符串数组 就可以创建在任意位置的下拉悬浮弹出框控件

##### 因为此需求通常定制性较强 — 为了迎合不同需求, 建议拖入项目中使用

### demo展示 - 由于网络原因, 可能gif效果图会展示的比较卡, 可以下载运行查看demo---简单使用代码

### 使用---注: 详细数据源格式  请参考demo

\- 仅需几行代码即可使用

```
// 创建
CFPopOverView *popView = [[CFPopOverView alloc] initWithOrigin:CGPointMake(_pointV.cf_centerX, _pointV.cf_centerY) titles:titleArr images:nil];

// 展示
[popView show];

```

​         

```
// block回调
popView.selectRowAtIndex = ^(NSInteger rowIndex){
       // 选中条件后回调处理
};
```

\### 效果图集

![](/demo.gif) 



