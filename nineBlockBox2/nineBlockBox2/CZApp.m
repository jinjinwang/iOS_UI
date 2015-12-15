
//
//  CZApp.m
//  nineBlockBox2
//
//  Created by 王金金 on 15/12/15.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "CZApp.h"

@implementation CZApp

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
