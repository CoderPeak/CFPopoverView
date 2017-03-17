//
//  ViewController.m
//  CFPopoverView
//
//  Created by 陈峰 on 2017/3/14.
//  Copyright © 2017年 Peak. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CFFrame.h"
#import "CFPopOverView.h"

@interface ViewController ()
{
    UIView *_pointV;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.cf_width, 50)];
    titleL.numberOfLines = 0;
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = [UIColor blueColor];
    titleL.text = @"交流QQ 545486205\n个人github网址:https://github.com/CoderPeak";
    [self.view addSubview:titleL];
    
    UILabel *pointL = [[UILabel alloc] initWithFrame:CGRectMake(50, 220, 100, 40)];
    pointL.numberOfLines = 0;
    pointL.textAlignment = NSTextAlignmentCenter;
    pointL.textColor = [UIColor redColor];
    pointL.text = @"展示原点";
    [self.view addSubview:pointL];
    
    UIView *pointV = [[UIView alloc] initWithFrame:CGRectMake(100, 260, 3, 3)];
    pointV.layer.cornerRadius = 1.5;
    pointV.layer.backgroundColor = [UIColor redColor].CGColor;
    pointV.clipsToBounds = YES;
    [self.view addSubview:pointV];
    _pointV = pointV;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *str0 = @"点击展示";
    btn.titleLabel.numberOfLines = 0;
    [btn setTitle:str0 forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 160, 120, 40);
    btn.cf_centerX = self.view.cf_width/2;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn];
}

- (void)btnClicked:(UIButton *)btn
{
    NSMutableArray *titleArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        NSString *str = [NSString stringWithFormat:@"选择条件--%zd", i];
        [titleArr addObject:str];
    }
    
    CFPopOverView *popView = [[CFPopOverView alloc] initWithOrigin:CGPointMake(_pointV.cf_centerX, _pointV.cf_centerY) titles:titleArr images:nil];
    
    __weak typeof(self) wSelf = self;
    popView.selectRowAtIndex = ^(NSInteger rowIndex){
        __strong typeof(self) sSelf = wSelf;
        NSString *str = [NSString stringWithFormat:@"选中的索引是%zd, 内容是:\"%@\"", rowIndex, titleArr[rowIndex]];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"当前选中的是" message:str preferredStyle:UIAlertControllerStyleAlert];
        [sSelf presentViewController:alertController animated:NO completion:^{
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertController addAction:alertAction];
        }];
        
    };
    
    [popView show];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
