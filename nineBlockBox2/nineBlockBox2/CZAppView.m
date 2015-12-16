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
- (IBAction)download:(id)sender;
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
- (IBAction)download:(id)sender {
    // 初始化alertview
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"下载成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    //显示AlertView
    [alert show];
    NSLog(@"点击了下载按钮");
}
@end
