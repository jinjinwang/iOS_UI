//
//  字典转模型
//  CZApp.h
//  nineBlockBox2
//
//  Created by 王金金 on 15/12/15.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZApp : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *icon;

-(instancetype) initWithDict: (NSDictionary *) dict;
+(instancetype) appWithDict: (NSDictionary *) dict;

@end

