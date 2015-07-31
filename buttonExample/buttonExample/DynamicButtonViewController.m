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
    button.frame = CGRectMake(50, 50, 100, 100);
    
    // 通过代码为按钮注册一个单击事件
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 6. 把动态创建的按钮加到控制器所管理的那个view中
    [self.view addSubview:button];
    
}

-(void)buttonClick{
    NSLog(@"按钮被点击啦");
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
