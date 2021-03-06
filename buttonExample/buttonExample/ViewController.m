//
//  ViewController.m
//  buttonExample
//
//  Created by jinjinwang on 15/7/21.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *mybtn;
- (IBAction)scroll:(id)sender;

//-(IBAction)up;
//-(IBAction)down:(id)sender;
//-(IBAction)left;
//-(IBAction)right;
//-(IBAction)add:(id)sender;
//-(IBAction)minus:(id)sender;
-(IBAction)change:(UIButton *)sender;

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
/*
-(IBAction)up{
    NSLog(@"点击了up");
    // 坐标y减小
    // 获取按钮原始的frame的值，frame中包含了按钮的大小和坐标
//    CGRect rect = self.mybtn.frame;
    // 修改frame
//    rect.origin.y -= 10;
    // 重新把值赋给按钮
//    self.mybtn.frame = rect;
    [self moveWithX:0 andY:-10];
}

-(IBAction)down:(id)sender{
    NSLog(@"点击了down");
    // 坐标y增加
//    CGRect rect = self.mybtn.frame;
//    rect.origin.y += 10;
//    self.mybtn.frame = rect;
    [self moveWithX:0 andY:10];
}

-(IBAction)left{
    NSLog(@"点击了left");
    //  坐标x减小
//    CGRect rect = self.mybtn.frame;
//    rect.origin.x -= 10;
//    self.mybtn.frame = rect;
    [self moveWithX:-10 andY:0];
}

-(IBAction)right{
    NSLog(@"点击了right");
    // 坐标x增加
//    CGRect rect = self.mybtn.frame;
//    rect.origin.x += 10;
//    self.mybtn.frame = rect;
    [self moveWithX:10 andY:0];
}

-(IBAction)add:(id)sender{
    NSLog(@"放大");
//    CGRect rect = self.mybtn.frame;
//    rect.size.height += 5;
//    rect.size.width += 5;
//    self.mybtn.frame = rect;
    [self changeSizeWithWidth:5 andHeight:5];
}

-(IBAction)minus:(id)sender{
    NSLog(@"缩小");
//    CGRect rect = self.mybtn.frame;
//    rect.size.height -= 5;
//    rect.size.width -= 5;
//    self.mybtn.frame = rect;
    [self changeSizeWithWidth:-5 andHeight:-5];
}
 */
-(IBAction)change:(UIButton *)sender{
    // 通过frame改变位置和大小
    CGRect rect = self.mybtn.frame;
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
        case 7:
            // 平移
            NSLog(@"平移");
            // 在原始位置上进行平移
            // self.mybtn.transform = CGAffineTransformMakeTranslation(50, 0);
            // 在指定位置上进行平移
            self.mybtn.transform = CGAffineTransformTranslate(self.mybtn.transform, 50, 0);
            break;
        case 8:
            // 旋转
            NSLog(@"旋转");
            // 在原始位置上进行旋转
            // self.mybtn.transform = CGAffineTransformMakeRotation(M_PI_4);
            // 在指定位置上进行旋转
            self.mybtn.transform = CGAffineTransformRotate(self.mybtn.transform, M_PI_4);
            break;
        case 9:
            // 缩放
            NSLog(@"缩放");
            // 在原始位置上进行缩放
            // self.mybtn.transform = CGAffineTransformMakeScale(1.5, 1.5);
            // 在指定位置上进行缩放
            self.mybtn.transform = CGAffineTransformScale(self.mybtn.transform, 1.5, 1.5);
            break;
        case 10:
            NSLog(@"还原");
            // 清空之前设置的transform
            self.mybtn.transform = CGAffineTransformIdentity;
            
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
       // self.mybtn.frame = rect;
    }];
}

/**
 *  移动按钮位置
 *
 *  @param x x坐标变化值
 *  @param y y坐标变化值
 */
-(void) moveWithX:(CGFloat)x andY:(CGFloat)y{
    CGRect rect = self.mybtn.frame;
    rect.origin.x += x;
    rect.origin.y += y;
    self.mybtn.frame = rect;
}

/**
 *  缩放按钮的大小
 *
 *  @param w 按钮宽度变化值
 *  @param h 按钮高度变化值
 */
-(void) changeSizeWithWidth:(CGFloat)w andHeight:(CGFloat)h{
    CGRect rect = self.mybtn.frame;
    rect.size.width += w;
    rect.size.height += h;
    self.mybtn.frame = rect;
}

- (IBAction)scroll:(id)sender {
}

@end
