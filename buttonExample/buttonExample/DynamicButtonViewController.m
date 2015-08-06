//
//  DynamicButtonViewController.m
//  buttonExample
//  动态创建按钮
//
//  Created by jinjinwang on 15/7/30.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "DynamicButtonViewController.h"

@interface DynamicButtonViewController ()

@end

@implementation DynamicButtonViewController

/**
 *  当要显示一个界面时，首先创建这个界面对应的控制器，
 *  控制器创建好后，接着创建控制器所管理的那个view，当这个view加载完毕后就开始执行下面的方法了，所以只要viewDidLoad方法被执行了，就表示控制器所管理的view创建好了。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 动态创建自己的子控件
    // 1. 创建按钮(UIButton)
    // UIButton *button = [[UIButton alloc] init];
    // 创建一个自定义的按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 2. 设置按钮上显示的文字，根据不同状态进行设置
    [button setTitle:@"点我吧" forState:UIControlStateNormal];
    [button setTitle:@"干嘛呀" forState:UIControlStateHighlighted];
    
    // 3. 设置不同状态下的文字颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    // 4. 设置按钮的背景图片
    UIImage *imgNormal = [UIImage imageNamed:@"button1"];
    UIImage *imgHighlighted = [UIImage imageNamed:@"button2"];
    [button setBackgroundImage:imgNormal forState:UIControlStateNormal];
    [button setBackgroundImage:imgHighlighted forState:UIControlStateHighlighted];
    
    // 5. 设置按钮的frame
    button.frame = CGRectMake(116, 39, 100, 100);
    
    // 6. 通过代码为按钮注册一个单击事件
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:100];
    
    // 7. 把动态创建的按钮加到控制器所管理的那个view中
    [self.view addSubview:button];
    
    
    // 上下左右键，放大缩小键
    // 向上
    UIButton *up = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *upNormalImage = [UIImage imageNamed:@"up"];
    UIImage *upHighlightedImage = [UIImage imageNamed:@"up2"];
    [up setBackgroundImage:upNormalImage forState:UIControlStateNormal];
    [up setBackgroundImage:upHighlightedImage forState:UIControlStateHighlighted];
    up.frame = CGRectMake(143, 244, 60, 60);
    [up setTag:1];
    [up addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:up];
    
    // 向下
    UIButton *down = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *downNormalImage = [UIImage imageNamed:@"down"];
    UIImage *downHighlightedImage = [UIImage imageNamed:@"down2"];
    [down setBackgroundImage:downNormalImage forState:UIControlStateNormal];
    [down setBackgroundImage:downHighlightedImage forState:UIControlStateHighlighted];
    down.frame = CGRectMake(143, 349, 60, 60);
    [down setTag:2];
    [down addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:down];
    
    // 向左
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *leftNormalImage = [UIImage imageNamed:@"left"];
    UIImage *leftHighlightedImage = [UIImage imageNamed:@"left2"];
    [left setBackgroundImage:leftNormalImage forState:UIControlStateNormal];
    [left setBackgroundImage:leftHighlightedImage forState:UIControlStateHighlighted];
    left.frame = CGRectMake(75, 293, 60, 60);
    [left setTag:3];
    [left addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:left];
    
    // 向右
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *rightNormalImage = [UIImage imageNamed:@"right"];
    UIImage *rightHighlightedImage = [UIImage imageNamed:@"right2"];
    [right setBackgroundImage:rightNormalImage forState:UIControlStateNormal];
    [right setBackgroundImage:rightHighlightedImage forState:UIControlStateHighlighted];
    right.frame = CGRectMake(211, 294, 60, 60);
    [right setTag:4];
    [right addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:right];
    
    // 放大
    UIButton *big = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *bigNormalImage = [UIImage imageNamed:@"add"];
    UIImage *bigHighlightedImage = [UIImage imageNamed:@"add2"];
    [big setBackgroundImage:bigNormalImage forState:UIControlStateNormal];
    [big setBackgroundImage:bigHighlightedImage forState:UIControlStateHighlighted];
    big.frame = CGRectMake(134, 420, 84, 55);
    [big setTag:5];
    [big addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:big];
    
    // 缩小
    UIButton *small = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *smallNormalImage = [UIImage imageNamed:@"minus"];
    UIImage *smallHighlightedImage = [UIImage imageNamed:@"minus2"];
    [small setBackgroundImage:smallNormalImage forState:UIControlStateNormal];
    [small setBackgroundImage:smallHighlightedImage forState:UIControlStateHighlighted];
    small.frame = CGRectMake(134, 484, 84, 55);
    [small setTag:6];
    [small addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:small];
    
}

-(void)buttonClick{
    NSLog(@"按钮被点击啦");
}

-(void)change:(UIButton *)sender{
    NSLog(@"点击了－－tag＝%ld", sender.tag);
    // 获取到目标按钮
    UIButton *mybtn = (UIButton *)[self.view viewWithTag:100];
    
    // 通过frame改变位置和大小
    CGRect rect = mybtn.frame;
    // center表示的是控件中心的坐标，改变位置
    // CGPoint point = self.mybtn.center;
    // 通过bounds改变大小
    // CGRect bounds = self.mybtn.bounds;
    
    switch (sender.tag) {
        case 1:
            // up
            rect.origin.y -= 10;
            // point.y -= 10;
            break;
        case 2:
            // down
            rect.origin.y += 10;
            // point.y += 10;
            break;
        case 3:
            // left
            rect.origin.x -= 10;
            // point.x -= 10;
            break;
        case 4:
            // right
            rect.origin.x += 10;
            // point.x += 10;
            break;
        case 5:
            // big
            rect.size.height += 10;
            rect.size.width += 10;
            // bounds.size.height += 10;
            // bounds.size.width += 10;
            break;
        case 6:
            // small
            rect.size.height -= 10;
            rect.size.width -= 10;
            // bounds.size.height -= 10;
            // bounds.size.width -= 10;
            break;
        default:
            break;
    }
    // 没有动画，直接执行
    // self.mybtn.frame = rect;
    // self.mybtn.center = point;
    // self.mybtn.bounds = bounds;
    
    /****************************************************
     // 通过头尾式动画的方式执行
     // 1.开启一个动画
     [UIView beginAnimations:nil context:nil];
     // 2.设置动画的执行时间
     [UIView setAnimationDuration:0.5];
     
     //==============需要执行动画的动作======================
     self.mybtn.frame = rect;
     // self.mybtn.center = point;
     // self.mybtn.bounds = bounds;
     //===================================================
     
     // 3. 提交动画
     [UIView commitAnimations];
     
     *****************************************************/
    
    // 通过block方式实现动画
    [UIView animateWithDuration:0.5 animations:^{
        // 执行动画的代码
        mybtn.frame = rect;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
