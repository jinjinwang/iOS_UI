//
//  ViewController.m
//  PictureGame
//
//  Created by 王金金 on 15/12/21.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "ViewController.h"
#import "WJPicture.h"

@interface ViewController ()

/**
 *  图片集合, 数组里面保存的数组, 加载时随机取出一组图片集合
 */
@property(nonatomic, strong) NSArray *pictures;

@end

@implementation ViewController

-(NSArray *)pictures{
    // 重写pictures的set方法, 实现懒加载
    if(_pictures == nil){
        // 从plist文件中读取数据
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pics.plist" ofType:nil];
        NSArray *arrs = [NSArray arrayWithContentsOfFile:path];
        
        //随机取一组图片
        int x = arc4random() % [arrs count];
        NSLog(@"共有%d组图片, 随机取 : %d" , [arrs count], x);
        NSArray *arr = arrs[x];
        
        NSMutableArray *marray = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            [marray addObject:[WJPicture pictureWithDict:dict]];
            
        }
        _pictures = marray;
    }
    return _pictures;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 图片框的宽
    CGFloat picWidth = 180;
    // 图片框的高
    CGFloat picHeight = 240;
    // 距离左边界的宽度
    CGFloat marginX = (self.view.frame.size.width - 4*picWidth )/ 2;
    CGFloat marginY = (self.view.frame.size.width - 4*picHeight)/ 2;
    int columns = 4;
    
    
    
    for (int i; i < [self.pictures count]; i++) {
        // 行索引
        int rowIndex = i % columns;
        // 列索引
        int columnIndex = i / columns;
        
        // 获取数据
        WJPicture *picture = self.pictures[i];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:picture.icon];
        imageView.frame = CGRectMake(marginX + rowIndex * picWidth, marginY + columnIndex * picHeight, picWidth, picHeight);
        [self.view addSubview:imageView];
        
        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
