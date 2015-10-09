//
//  ViewController.m
//  UIViewState
//
//  Created by 王金金 on 15/10/9.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtField;

@end

@implementation ViewController
const NSString* kSaveKey = @"version";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  实现该控制器中的控件或数据的保存, 实际上就是向一个归档文件中编码的过程
 *
 *  @param coder <#coder description#>
 */
-(void) encodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"encode restorable state...");
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:self.txtField.text forKey:kSaveKey];
}

-(void) decodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"decode restorable state...");
    [super decodeRestorableStateWithCoder:coder];
    self.txtField.text = [coder decodeObjectForKey:kSaveKey];
}

@end
