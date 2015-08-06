//
//  PhotographViewController.m
//  buttonExample
//
//  Created by jinjinwang on 15/8/4.
//  Copyright (c) 2015年 jinjinwang. All rights reserved.
//

#import "PhotographViewController.h"

@interface PhotographViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbIndex;  // 索引序号
@property (weak, nonatomic) IBOutlet UIImageView *img;  // 图片
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;  // 标题
@property (weak, nonatomic) IBOutlet UIButton *btnPre;  // 上一张按钮
@property (weak, nonatomic) IBOutlet UIButton *btnNext; // 下一张按钮
- (IBAction)pre; // 上一张
- (IBAction)next; // 下一张

@property (nonatomic, assign) int index; // 当前索引
@property (nonatomic, strong) NSArray *pics; // 照片数据

@end

@implementation PhotographViewController

/**
 *  重写pics属性的get方法
 *
 *  @return 照片数组数据
 */
- (NSArray *)pics{
    // 懒加载
    if (_pics == nil) {
        // 加载pic.plist文件中的数据到pics中
        // [NSBundle mainBundle]表示获取这个app安装到手机上时的根目录，
        // 然后在app的安装根目录下搜索pic.plist文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"];
        // 读取数据文件
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSLog(@"%@", array);
        _pics = array;
        
    }
    return _pics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self pics];
    
    // 初始化时显示第一张图片
    self.index = 0;
    [self showData];
}

-(void) showData{
    // 从数组中获取当前这张图片的数据
    NSDictionary *dict = self.pics[self.index];
    // 把获取到的数据设置给界面上的控件
    self.lbIndex.text = [NSString stringWithFormat:@"%d/%ld", (self.index + 1), self.pics.count];
    // 通过image属性来设置图片框里面的图片
    self.img.image = [UIImage imageNamed:dict[@"pic"]];
    // 设置标题
    self.lbTitle.text = dict[@"title"];
    
    // 设置“上一张”和“下一张”按钮是否可点击
    // 翻到第一张时“上一张”按钮不能点击
    self.btnPre.enabled = (self.index != 0);
    //  翻到最后一张时“下一张”按钮不能点击
    self.btnNext.enabled = (self.index != (self.pics.count - 1));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 *  上一页
 */
- (IBAction)pre {
    // 改变索引
    self.index--;
    // 显示数据
    [self showData];
}

/**
 *  下一页
 */
- (IBAction)next {
    // 改变索引
    self.index++;
    // 显示数据
    [self showData];
}
@end
