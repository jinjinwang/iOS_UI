//
//  WJPicture.m
//  PictureGame
//
//  Created by 王金金 on 15/12/21.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "WJPicture.h"

@implementation WJPicture

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [self init]){
        self.icon = dict[@"icon"];
        self.index = dict[@"index"];
    }
    return self;
}

+(instancetype)pictureWithDict:(NSDictionary *)dict{
    return [[self init] initWithDict:dict];
}


@end
