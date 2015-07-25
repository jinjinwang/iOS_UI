//
//  QQLoginUIViewController.m
//  calculator
//
//  Created by jinjinwang on 15/7/21.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "QQLoginUIViewController.h"

@interface QQLoginUIViewController ()

@property (weak, nonatomic) IBOutlet UITextField *qqTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

- (IBAction)login;

@end

@implementation QQLoginUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)login {
    NSString *qq = self.qqTextField.text;
    NSString *pwd = self.pwdTextField.text;
    NSLog(@"QQ : %@, 密码 : %@", qq, pwd);
    
    [self.view endEditing:YES];
}
@end
