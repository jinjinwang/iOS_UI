//
//  CZAppView.h
//  自定义view, 用于接收xib中的控件
//
//  Created by 王金金 on 15/12/15.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZApp;
@interface CZAppView : UIView
@property(nonatomic, strong) CZApp *model;
+(instancetype) appView;
@end
