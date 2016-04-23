//
//  WJPicture.h
//  PictureGame
//
//  Created by 王金金 on 15/12/21.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJPicture : UIView

@property(nonatomic, copy) NSString *icon; // 图片
@property(nonatomic, assign) int index; // 原始序号

-(instancetype) initWithDict:(NSDictionary *) dict;
+(instancetype) pictureWithDict:(NSDictionary *) dict;

@end
