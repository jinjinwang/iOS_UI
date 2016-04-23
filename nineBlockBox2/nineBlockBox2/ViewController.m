//
//  ViewController.m
//  nineBlockBox2
//  MVC: CZApp + CZAppView + ViewController
//
//  Created by 王金金 on 15/12/14.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "ViewController.h"
#import "CZApp.h"
#import "CZAppView.h"


// shift + option + command + 左 : 折叠所有的代码
// shift + option + command + 右 : 展开所有的代码
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
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:path];
        
        // 3. 创建一个可变数组来存储对象
        NSMutableArray *marr = [NSMutableArray array];
        
        // 4. 循环遍历字典数组, 将字典数据转换成对象数据
        for (NSDictionary *dict in dictArr) {
            // CZApp *app = [CZApp appWithDict:dict];
            CZApp *app = [[CZApp alloc] initWithDict:dict];
            
            [marr addObject:app];
        }
        _apps = marr;
        
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 第一行距离顶部的距离
    CGFloat marginTop = 30;
    
    CGFloat appW = 75; // 图标的宽
    CGFloat appH = 110; // 图标的高
    CGFloat appX = 0;
    CGFloat appY = 0;
    // 每行显示的个数
    int columns = 3;
    // 获取控制器所管理view的宽度
    CGFloat viewWidth = self.view.frame.size.width;
    
    // 每个应用的水平间距
    CGFloat marginX = (viewWidth - columns * appW) / (columns + 1);
    CGFloat marginY = marginX; // 垂直间距假设和水平一样
    NSLog(@"%u", [self.apps count]);
    
    for (int i = 0; i < [self.apps count]; i++) {
        // 0. 获取数据
        CZApp *app = self.apps[i];
        
        // 1. 创建自定义view
        CZAppView *appView = [CZAppView appView];
        
        // 2. 设置appview的属性
        // 设置appview的frame属性
        // 通过行和列的索引确定坐标
        int rowIndex = i % columns; // 行索引
        int columnIndex = i / columns; // 列索引
        appX = marginX + (appW + marginX) * rowIndex;
        appY = marginTop + (appH + marginY) * columnIndex;
        NSLog(@"第%d个: (%d, %d), (%f, %f)", i, rowIndex, columnIndex, appX, appY);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        // 3. 将appview加到self.view(控制器所管理的那个view)
        [self.view  addSubview:appView];
        
        // 4. 给控件设置值
        appView.model = app;
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end