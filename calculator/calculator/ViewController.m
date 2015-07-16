//
//  ViewController.m
//  calculator
//
//  Created by jinjinwang on 15/7/16.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "ViewController.h"

/**
 *  类扩展
 */
@interface ViewController ()

-(IBAction)compute;

@property (weak, nonatomic) IBOutlet UITextField *num1;

@property (weak, nonatomic) IBOutlet UITextField *num2;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  点击计算按钮
 */
-(IBAction)compute{
    NSLog(@"点击了按钮。。。");
    // 1.获取用户输入
    int n1 = [self.num1.text intValue];
    int n2 = [self.num2.text intValue];
    // 2. 计算
    int result = n1 + n2;
    // 3. 把结果显示到label上
    self.resultLabel.text = [NSString stringWithFormat:@"%d", result];
    // 4. 把键盘收回去
    // 谁调出的键盘，谁就是键盘的“第一响应者”，让“第一响应者”辞职，就可以把键盘收回去
//    [self.num1 resignFirstResponder];
//    [self.num2 resignFirstResponder];
    
    // 5. 把键盘收回去的第二种做法
    // self.view表示是当前控制器所管理的那个view(每个控制器都会管理一个view)
    // 思路：让控制器所管理的view停止编辑，则这个view中的子控件叫出的键盘都会收回去
    [self.view endEditing:YES];
    
}

@end
