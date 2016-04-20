//
//  ViewController.m
//  myUIView
//
//  Created by 王金金 on 15/9/25.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize list = _list;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"美国", @"菲律宾",
                      @"黄岩岛", @"中国", @"泰国", @"越南", @"老挝",
                      @"日本" , nil];
    self.list = array;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    // 根据标识符TableSampleIdentifier寻找当前可以重用的UITableViewCell, 当某行滑出当前可见区域后，我们重用它所对应的UITableViewCell对象，那么就可以节省内存和资源
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil) {
        // UITableViewCellStyleDefault是表示UITableViewCell风格的常数
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    // 参数indexPath,它将行号row和部分号section合并了
    // 获取行号
    NSUInteger row = [indexPath row];
    // 给cell设置其文本
    cell.textLabel.text = [self.list objectAtIndex:row];
    return cell;
}

-(void)viewDidUnload{
    [super viewDidUnload];
    
    self.list = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
