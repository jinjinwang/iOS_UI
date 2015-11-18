//
//  ViewController.m
//  nineBlockBox
//
//  Created by 王金金 on 15/10/15.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 用来保存应用的数据
@property (nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

/**
 *  重写apps的get方法, 进行懒加载数据
 *
 *  @return NSArray对象
 */
- (NSArray *) apps{
    if(_apps == nil) {
        // 加载数据
        // 1. 获取app.plist在手机上的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        // 2. 根据路径加载数据
        _apps = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 第一行距离顶部的距离
    CGFloat marginTop = 30;
    
    CGFloat appW = 65;
    CGFloat appH = 65;
    CGFloat appX = 50;
    CGFloat appY = 50;
    // 每行显示的个数
    int columns = 3;
    // 获取控制器所管理view的宽度
    CGFloat viewWidth = self.view.frame.size.width;
    
    // 每个应用的水平间距
    CGFloat marginX = (viewWidth - columns * appW) / (columns + 1);
    CGFloat appX0 = marginX;
    NSLog(@"%lu", [self.apps count]);
    for (int i = 0; i < [self.apps count]; i++) {
        NSDictionary *dic = self.apps[i];
        // 创建应用图标
        UIView *appview = [[UIView alloc] init];
        // 设置uiview的背景色
        UIColor *color = [UIColor colorWithPatternImage: [UIImage imageNamed:dic[@"icon"]]];
        appview.backgroundColor = color;
        
        // 设置uiview的frame属性
        if (i != 0 && i % columns == 0) {
            appY = appY + appH + marginX;
            appX = appX0;
        }else if(i != 0){
            appX = appX + appW + marginX;
        }
        NSLog(@"第%d个: appX = %f, appY=%f", i, appX, appY);
        appview.frame = CGRectMake(appX, appY, appW, appH);
        
        // 将appview加到self.view(控制器所管理的那个view)
        [self.view  addSubview:appview];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
