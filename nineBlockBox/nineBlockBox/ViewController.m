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
    NSLog(@"%lu", [self.apps count]);
    
    for (int i = 0; i < [self.apps count]; i++) {
        NSDictionary *dic = self.apps[i];
        // 1. 创建每个应用图标
        UIView *appview = [[UIView alloc] init];
        
        // 2. 设置appview的属性
        // 2.1 设置appview的背景色
        appview.backgroundColor = [UIColor blueColor];
        
        // 2.2 设置appview的frame属性
        // 通过行和列的索引确定坐标
        int rowIndex = i % columns; // 行索引
        int columnIndex = i / columns; // 列索引
        appX = marginX + (appW + marginX) * rowIndex;
        appY = marginTop + (appH + marginY) * columnIndex;
        NSLog(@"第%d个: (%d, %d), (%f, %f)", i, rowIndex, columnIndex, appX, appY);
        appview.frame = CGRectMake(appX, appY, appW, appH);
        
        // 3. 将appview加到self.view(控制器所管理的那个view)
        [self.view  addSubview:appview];
        
        // 向appview中增加子控件(UIImageView, UILabel, UIButton)
        UIImageView *imageView = [[UIImageView alloc] init];
        UIColor *color = [UIColor colorWithPatternImage: [UIImage imageNamed:dic[@"icon"]]];
        imageView.backgroundColor = color;
        CGFloat iconW = 65;
        CGFloat iconH = 65;
        imageView.frame = CGRectMake((appW - iconW)/2, 0, iconW, iconH);
        [appview addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        CGFloat labelH = 10;
        label.frame = CGRectMake(0, iconH, appW, labelH);
        label.text = dic[@"name"];
        // 设置文本居中
        label.textAlignment = UITextAlignmentCenter;
        // 设置字体大小
        label.font = [UIFont fontWithName:@"Helvetica" size:14];
        label.numberOfLines = 1;
        //label.numberOfLines = 0;
        label.adjustsFontSizeToFitWidth = YES;
        [appview addSubview:label];
        
        UIButton *button = [[UIButton alloc] init];
        CGFloat buttonH = 20;
        button.frame = CGRectMake((appW - iconW)/2, iconH + labelH + 8, iconW, buttonH);
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttonhighlighted"] forState:UIControlStateHighlighted];
        [button setTitle:@"下载" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        // 设置点击事件
        [button addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
        [appview addSubview:button];
        
    }
    
    
    
}

/**
 *  处理下载点击事件
 *
 *  @param sender <#sender description#>
 */
-(void)download:(UIButton *)sender{
    // 初始化alertview
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"下载成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    //显示AlertView
    [alert show];
    NSLog(@"点击了按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
