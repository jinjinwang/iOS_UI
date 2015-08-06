//
//  ViewController.m
//  tomcat
//
//  Created by jinjinwang on 15/8/5.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)knockout;

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

- (IBAction)knockout{
    NSLog(@"knockout...");
    // 1. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 16; i++) {
        NSString *path = [NSString stringWithFormat:@"%02d.png", i];
//        UIImage *img = [UIImage imageNamed:path];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:img];
    }
    // 2. 设置UIImageview图片框的animationImages属性，这个属性中包含了执行动画的图片
    self.imageView.animationImages = arrayM;
    // 3. 设置动画的持续时间
    self.imageView.animationDuration = self.imageView.animationImages.count * 0.1;
    // 4. 设置动画的执行次数
    self.imageView.animationRepeatCount = 1;
    // 5. 开启动画
    [self.imageView startAnimating];
}



@end
