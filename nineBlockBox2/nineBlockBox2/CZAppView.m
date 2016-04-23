//
//  CZAppView.m
//  nineBlockBox2
//
//  Created by 王金金 on 15/12/15.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "CZAppView.h"
#import "CZApp.h"
/**
 *  类扩展, 把控件放在.m文件中可以不暴露给外部调用者, 封装自己的方法去设置, 这样更安全
 */
@interface CZAppView ()
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
- (IBAction)download:(UIButton *)sender;
@end

@implementation CZAppView

+(instancetype)appView{
    // 通过动态加载xib文件创建里面的view
    // 获取应用程序的根目录
    NSBundle *rootBundle = [NSBundle mainBundle];
    NSLog(@"应用根目录: %@", [rootBundle bundlePath]);
    // 在根目录下搜索xib文件
    return [[rootBundle loadNibNamed:@"CZAppView" owner: nil options:nil] lastObject];
}

// 重写model的set方法
-(void)setModel:(CZApp *)model{
    // 先赋值
    _model = model;
    
    // 解析模型数据, 再将模型数据赋值给UIView中的各个子控件
    self.appIcon.image = [UIImage imageNamed:model.icon];
    self.appName.text = model.name;
}


/**
 *  处理下载点击事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)download:(UIButton *)sender {
    // 初始化alertview
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"下载成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    //显示AlertView
    // [alert show];
    NSLog(@"点击了下载按钮");
    // 1. 禁用当前按钮
    sender.enabled = NO;
    
    // 2. 创建一个消息提示框
    UILabel *label = [[UILabel alloc] init];
    // 2.1 设置文字
    label.text = @"正在下载...";
    // 2.2 设置背景色
    label.backgroundColor = [UIColor blackColor];
    CGFloat lbWith = 200;
    CGFloat lbHeight = 100;
    CGFloat y = (self.superview.frame.size.height - lbHeight) / 2;
    CGFloat x = (self.superview.frame.size.width - lbWith) / 2;
    // 2.3 设置位置
    label.frame = CGRectMake(x, y, lbWith, lbHeight);
    // 2.4 设置字体颜色
    label.textColor = [UIColor redColor];
    // 2.5 设置居中
    label.textAlignment = NSTextAlignmentCenter;
    // 2.6 设置字体大小和粗体
    label.font = [UIFont boldSystemFontOfSize:17];
    // 2.7 设置透明度
    label.alpha = 0.0;
    // 2.8 设置圆角
    // 设置四个角的半径
    label.layer.cornerRadius= 10;
    // 把多余的部分剪掉
    label.layer.masksToBounds = YES;
    
    
    // 2.9 通过动画的方式来显示label
    [UIView animateWithDuration:1.5 animations:^{
        label.alpha = 0.7;
    } completion:^(BOOL finished) {
        if(finished){
            // 隔一段时间再启动另外一个动画
            [UIView animateKeyframesWithDuration:1.5 delay:1 options:UIViewAnimationCurveLinear animations:^{
                label.alpha = 0.0;
            } completion:^(BOOL finished) {
                if(finished){
                    [label removeFromSuperview];
                }
            }];
            
        }
    }];
    
    
    [self.superview addSubview:label];
    
}
@end
